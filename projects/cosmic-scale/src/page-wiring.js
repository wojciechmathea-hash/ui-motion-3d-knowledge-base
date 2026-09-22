/* Adapted from the navigation, reveal, hero-exit, cursor and grain wiring in
   ThreeUI Community Kage at commit 68802d5. No visual system is created here. */
(function () {
  'use strict';

  const REDUCE = matchMedia('(prefers-reduced-motion: reduce)').matches;
  const COARSE = matchMedia('(hover: none)').matches;
  const $ = selector => document.querySelector(selector);
  const $$ = selector => Array.from(document.querySelectorAll(selector));
  const clamp = (value, min, max) => Math.min(max, Math.max(min, value));
  const lerp = (a, b, t) => a + (b - a) * t;
  const smooth = (a, b, value) => {
    const t = clamp((value - a) / Math.max(0.0001, b - a), 0, 1);
    return t * t * (3 - 2 * t);
  };
  const vpW = () => document.documentElement.clientWidth;
  const vpH = () => window.innerHeight;
  const sections = ['#hero', '#gate', '#pathways', '#lessons', '#eternity', '.foot']
    .map(selector => $(selector))
    .filter(Boolean);
  const sectionNames = [
    'Wprowadzenie',
    'Ziemia i Księżyc',
    'Układ Słoneczny',
    'Atlas odległości',
    'Głębokie pole',
    'Źródła'
  ];
  const chapterTargets = ['#gate', '#pathways', '#lessons', '#eternity'];

  function splitHeadingWords() {
    if (REDUCE) return;
    $$('h1.display, h2.display').forEach(heading => {
      const lines = heading.querySelectorAll('.mask-line');
      const targets = lines.length ? Array.from(lines) : [heading];
      targets.forEach(target => {
        if (target.dataset.wordReady === 'true') return;
        const phrase = target.textContent.replace(/\s+/g, ' ').trim();
        if (!phrase) return;
        target.dataset.wordReady = 'true';
        target.classList.add('word-reveal');
        target.setAttribute('aria-label', phrase);
        target.textContent = '';
        phrase.split(' ').forEach((word, index) => {
          if (index) target.appendChild(document.createTextNode(' '));
          const mask = document.createElement('span');
          const inner = document.createElement('span');
          mask.className = 'word-mask';
          mask.setAttribute('aria-hidden', 'true');
          inner.className = 'word';
          inner.textContent = word;
          inner.style.setProperty('--word-delay', `${index * 72}ms`);
          mask.appendChild(inner);
          target.appendChild(mask);
        });
      });
    });
  }

  function wireReveals() {
    splitHeadingWords();
    const groups = new Map();
    const items = $$('[data-rv], .mask-line');
    items.forEach(element => {
      const key = element.parentElement;
      const group = groups.get(key) || [];
      group.push(element);
      groups.set(key, group);
    });
    groups.forEach(group => group.forEach((element, index) => {
      element.dataset.rvd = index * 85;
    }));
    const observer = new IntersectionObserver(entries => {
      entries.forEach(entry => {
        if (!entry.isIntersecting) return;
        observer.unobserve(entry.target);
        const delay = Number(entry.target.dataset.rvd || 0);
        setTimeout(() => entry.target.classList.add('rv-in'), REDUCE ? 0 : delay);
      });
    }, { rootMargin: '0px 0px -10% 0px', threshold: 0.04 });
    items.forEach(element => {
      if (!element.closest('#hero')) observer.observe(element);
    });
  }

  function sectionIndex() {
    const marker = scrollY + vpH() * 0.46;
    let bestIndex = 0;
    let bestDistance = Infinity;
    sections.forEach((section, index) => {
      const center = section.offsetTop + Math.min(section.offsetHeight, vpH()) * 0.5;
      const distance = Math.abs(center - marker);
      if (distance < bestDistance) {
        bestDistance = distance;
        bestIndex = index;
      }
    });
    return bestIndex;
  }

  function scrollToElement(element) {
    if (!element) return;
    scrollTo({
      top: element.id === 'top' ? 0 : Math.max(0, element.offsetTop - 40),
      behavior: REDUCE ? 'auto' : 'smooth'
    });
  }

  function wireNav() {
    const nav = $('#nav');
    const rail = $('#rail');
    const links = $$('.nav-link');
    const burger = $('.nav-burger');
    let last = scrollY;

    sections.forEach((section, index) => {
      const button = document.createElement('button');
      button.innerHTML = '<i></i>';
      button.title = sectionNames[index];
      button.setAttribute('aria-label', sectionNames[index]);
      button.addEventListener('click', () => scrollToElement(section));
      rail.appendChild(button);
    });
    const dots = $$('#rail button');

    const closeMenu = () => {
      nav.classList.remove('menu-open');
      burger.classList.remove('active');
      burger.setAttribute('aria-expanded', 'false');
      document.documentElement.classList.remove('nav-open');
    };
    burger.setAttribute('aria-controls', 'navlinks');
    burger.setAttribute('aria-expanded', 'false');
    burger.addEventListener('click', () => {
      if (vpW() > 820) return;
      const open = !nav.classList.contains('menu-open');
      if (open) nav.classList.remove('hide');
      nav.classList.toggle('menu-open', open);
      burger.classList.toggle('active', open);
      burger.setAttribute('aria-expanded', String(open));
      document.documentElement.classList.toggle('nav-open', open);
    });
    links.forEach(link => link.addEventListener('click', closeMenu));
    addEventListener('keydown', event => {
      if (event.key === 'Escape') closeMenu();
    });
    addEventListener('resize', () => {
      document.documentElement.style.setProperty('--vw', `${vpW()}px`);
      if (vpW() > 820) closeMenu();
    }, { passive: true });

    const linkSections = links.map(link => sections.indexOf($(link.getAttribute('href'))));
    const update = () => {
      const y = scrollY;
      nav.classList.toggle('stuck', y > 40);
      nav.classList.toggle('hide', !nav.classList.contains('menu-open') && y > last + 4 && y > vpH() * 0.8);
      last = y;
      const active = sectionIndex();
      dots.forEach((dot, index) => dot.classList.toggle('on', index === active));
      links.forEach((link, index) => link.classList.toggle('on', linkSections[index] === active));
    };
    addEventListener('scroll', update, { passive: true });
    addEventListener('resize', update, { passive: true });
    update();

    $$('a[href^="#"]').forEach(anchor => anchor.addEventListener('click', event => {
      const target = $(anchor.getAttribute('href'));
      if (!target) return;
      event.preventDefault();
      scrollToElement(target);
    }));
  }

  function wireChapterChips() {
    $$('[data-chip]').forEach((chip, index) => {
      const target = $(chapterTargets[index]);
      chip.setAttribute('role', 'link');
      chip.setAttribute('tabindex', '0');
      chip.setAttribute('aria-label', `Przejdź do: ${sectionNames[index + 1]}`);
      const activate = () => scrollToElement(target);
      chip.addEventListener('click', activate);
      chip.addEventListener('keydown', event => {
        if (event.key === 'Enter' || event.key === ' ') {
          event.preventDefault();
          activate();
        }
      });
      chip.addEventListener('mouseenter', () => chip.classList.add('on'));
      chip.addEventListener('mouseleave', () => chip.classList.remove('on'));
      chip.addEventListener('focus', () => chip.classList.add('on'));
      chip.addEventListener('blur', () => chip.classList.remove('on'));
    });
    $$('[data-les]').forEach(item => {
      item.setAttribute('tabindex', '0');
    });
  }

  function wireHeroExit() {
    const sequence = [
      { element: $('.peek'), at: 0, span: 0.26, blur: 10 },
      { element: $('.hero-cue'), at: 0.1, span: 0.3, shift: true },
      ...$$('.chip').map((element, index) => ({ element, at: 0.2 + index * 0.1, span: 0.3, shift: true })),
      { element: $('.chapters'), at: 0.6, span: 0.3 },
      { element: $('.hero-side'), at: 0.7, span: 0.3 }
    ].filter(item => item.element);
    let active = false;
    const apply = () => {
      const progress = clamp(scrollY / Math.max(1, vpH() * 0.58), 0, 1);
      if (progress <= 0) {
        if (!active) return;
        sequence.forEach(item => {
          item.element.style.opacity = '';
          item.element.style.transform = '';
          item.element.style.filter = '';
          item.element.style.pointerEvents = '';
          item.element.style.transition = '';
        });
        active = false;
        return;
      }
      active = true;
      sequence.forEach(item => {
        item.element.style.transition = 'none';
        const opacity = 1 - smooth(item.at, item.at + item.span, progress);
        item.element.style.opacity = opacity.toFixed(3);
        if (item.shift) item.element.style.transform = `translate3d(0,${((1 - opacity) * 15).toFixed(1)}px,0)`;
        if (item.blur) item.element.style.filter = opacity > 0.999 ? '' : `blur(${((1 - opacity) * item.blur).toFixed(1)}px)`;
        item.element.style.pointerEvents = opacity < 0.05 ? 'none' : '';
      });
    };
    addEventListener('scroll', apply, { passive: true });
    addEventListener('resize', apply, { passive: true });
    apply();
  }

  function wireCursor() {
    const dot = $('#cursor');
    if (!dot || COARSE || REDUCE) {
      if (dot) dot.style.display = 'none';
      return;
    }
    let x = vpW() / 2;
    let y = vpH() / 2;
    let targetX = x;
    let targetY = y;
    addEventListener('pointermove', event => {
      targetX = event.clientX;
      targetY = event.clientY;
    }, { passive: true });
    $$('[data-cursor]').forEach(element => {
      element.addEventListener('mouseenter', () => dot.classList.add('act'));
      element.addEventListener('mouseleave', () => dot.classList.remove('act'));
    });
    const tick = () => {
      x = lerp(x, targetX, 0.18);
      y = lerp(y, targetY, 0.18);
      dot.style.transform = `translate3d(${x.toFixed(1)}px,${y.toFixed(1)}px,0)`;
      requestAnimationFrame(tick);
    };
    tick();
  }

  function makeGrain() {
    const random = (() => {
      let value = 9;
      return () => {
        value |= 0;
        value = value + 0x6D2B79F5 | 0;
        let next = Math.imul(value ^ value >>> 15, 1 | value);
        next = next + Math.imul(next ^ next >>> 7, 61 | next) ^ next;
        return ((next ^ next >>> 14) >>> 0) / 4294967296;
      };
    })();
    const size = 180;
    const canvas = document.createElement('canvas');
    canvas.width = size;
    canvas.height = size;
    const context = canvas.getContext('2d');
    const image = context.createImageData(size, size);
    for (let index = 0; index < size * size; index += 1) {
      const shade = 110 + random() * 90;
      image.data[index * 4] = shade;
      image.data[index * 4 + 1] = shade;
      image.data[index * 4 + 2] = shade;
      image.data[index * 4 + 3] = 255;
    }
    context.putImageData(image, 0, 0);
    $('#grain').style.backgroundImage = `url(${canvas.toDataURL('image/png')})`;
  }

  function start() {
    document.documentElement.style.setProperty('--vw', `${vpW()}px`);
    makeGrain();
    wireReveals();
    wireNav();
    wireChapterChips();
    wireHeroExit();
    wireCursor();

    const preloader = $('#pre');
    const fill = $('#pre-fill');
    const percent = $('#pre-pct');
    if (fill) fill.style.right = '0%';
    if (percent) percent.textContent = '100';
    setTimeout(() => {
      if (preloader) preloader.classList.add('done');
      $('#hero').querySelectorAll('[data-rv], .mask-line').forEach((element, index) => {
        setTimeout(() => element.classList.add('rv-in'), REDUCE ? 0 : 120 + index * 95);
      });
    }, REDUCE ? 0 : 360);
  }

  if (document.readyState === 'loading') {
    addEventListener('DOMContentLoaded', start, { once: true });
  } else {
    start();
  }
})();

