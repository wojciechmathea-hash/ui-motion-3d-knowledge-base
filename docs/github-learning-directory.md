# Repozytoria GitHub do nauki UI/UX i efektów webowych

Stan weryfikacji: 2026-09-21. Poniższe repozytoria są indeksowane jako oficjalne linki, bez masowego kopiowania. Licencja repozytorium nie obejmuje automatycznie zdjęć, filmów, fontów, modeli ani innych assetów demonstracyjnych.

Źródłem maszynowym jest `catalog/learning-repository-registry.json`.

## UI, UX, dostępność i design systems

| Repozytorium | Czego uczy | Licencja |
|---|---|---|
| [Design Resources for Developers](https://github.com/bradtraversy/design-resources-for-developers) | Mapa darmowych zasobów projektowych | MIT |
| [Awesome Design Tools](https://github.com/goabstract/Awesome-Design-Tools) | Narzędzia i workflow product design | MIT |
| [WAI-ARIA APG](https://github.com/w3c/aria-practices) | Wzorce interakcji, klawiatura i dostępność | W3C Software and Document License |
| [Carbon](https://github.com/carbon-design-system/carbon) | Tokeny, motion i architektura dużego design systemu | Apache-2.0 |
| [React Spectrum](https://github.com/adobe/react-spectrum) | Dostępne zachowania komponentów i internacjonalizacja | Apache-2.0 |
| [Fluent UI](https://github.com/microsoft/fluentui) | Enterprise UI i wieloplatformowe komponenty | MIT |
| [Primer React](https://github.com/primer/react) | Produkcyjny design system React | MIT |
| [Material Web](https://github.com/material-components/material-web) | Web Components, tokeny i Material Design | Apache-2.0 |
| [Open UI](https://github.com/openui/open-ui) | Standardy kontrolek przeglądarkowych | licencje W3C |

## Animacje i efekty na stronach

| Repozytorium | Czego uczy | Licencja |
|---|---|---|
| [Motion](https://github.com/motiondivision/motion) | Gesty, layout, scroll i animacje React/JS | MIT; bez Motion+ |
| [Anime.js](https://github.com/juliangarnier/anime) | Timeline, easing, stagger, SVG i Canvas | MIT |
| [AutoAnimate](https://github.com/formkit/auto-animate) | Minimalne animowanie zmian layoutu | MIT |
| [Lenis](https://github.com/darkroomengineering/lenis) | Integracja smooth scroll i zdarzeń scroll | MIT |
| [Locomotive Scroll](https://github.com/locomotivemtl/locomotive-scroll) | Progress scrolla i data-driven parallax | MIT |
| [AOS](https://github.com/michalsnik/aos) | Deklaratywne reveal-on-scroll | MIT |
| [Barba.js](https://github.com/barbajs/barba) | Lifecycle przejść między stronami | MIT |
| [lottie-web](https://github.com/airbnb/lottie-web) | Renderowanie animacji wektorowych | MIT |
| [Swiper](https://github.com/nolimits4web/swiper) | Touch, carousel, parallax i 3D transitions | MIT |
| [tsParticles](https://github.com/tsparticles/tsparticles) | Particle systems i interaktywne tła | MIT |
| [Motion Canvas](https://github.com/motion-canvas/motion-canvas) | Sceny, sygnały i timeline w TypeScript | MIT |

Smooth scrolling nie jest domyślną rekomendacją. Każde użycie wymaga testów klawiatury, anchorów, historii, find-in-page oraz `prefers-reduced-motion`.

## Parallax i przestrzenne interakcje

| Repozytorium | Wzorzec | Licencja |
|---|---|---|
| [Parallax.js](https://github.com/wagerfield/parallax) | Warstwy sterowane kursorem i orientacją urządzenia | MIT |
| [Rellax](https://github.com/dixonandmoe/rellax) | Lekki scroll parallax | MIT |
| [simpleParallax.js](https://github.com/geosigno/simpleParallax.js) | Parallax obrazów | MIT |
| [Atropos](https://github.com/nolimits4web/atropos) | 3D tilt kart, obrazów i warstw | MIT |

Parallax ma być dekoracją. Treść i akcje muszą pozostać dostępne po jego wyłączeniu, na urządzeniu dotykowym i przy reduced motion.

## WebGL, Three.js, GLSL i GPU

| Repozytorium | Czego uczy | Licencja |
|---|---|---|
| [WebGL Fundamentals](https://github.com/gfxfundamentals/webgl-fundamentals) | Surowe WebGL, macierze, tekstury i światło | BSD-3-Clause |
| [WebGL2 Fundamentals](https://github.com/gfxfundamentals/webgl2-fundamentals) | WebGL2 i współczesne techniki renderingu | BSD-3-Clause |
| [Three.js Fundamentals](https://github.com/gfxfundamentals/threejsfundamentals) | Uporządkowany kurs Three.js | BSD-3-Clause |
| [WebGL2 Examples](https://github.com/tsherif/webgl2examples) | Deferred rendering, particles, SSAO i transparency | MIT |
| [shader-school](https://github.com/stackgl/shader-school) | Interaktywne ćwiczenia GLSL | MIT |
| [awesome-webgl](https://github.com/sjfricke/awesome-webgl) | Katalog bibliotek, artykułów i narzędzi | CC0-1.0 dla listy |
| [regl](https://github.com/regl-project/regl) | Funkcyjna abstrakcja nad WebGL | MIT |
| [luma.gl](https://github.com/visgl/luma.gl) | Produkcyjne abstrakcje WebGL/WebGPU | MIT |
| [Three.js](https://github.com/mrdoob/three.js) | Canonical source, manual i przykłady | MIT |
| [React Three Fiber](https://github.com/pmndrs/react-three-fiber) | Three.js w React i render-loop hooks | MIT |
| [WebGL Sandbox](https://github.com/benc-uk/webgl-sandbox) | Edytor GLSL z audio i MIDI | MIT |
| [SHADERed](https://github.com/dfranx/SHADERed) | Shader IDE i debugger GPU | MIT |
| [Three.js Examples](https://github.com/ysulyma/threejs-examples) | Małe projekty i wizualizacje matematyczne | MIT |

## Sposób użycia

1. Najpierw przeczytaj README, dokumentację i przykład minimalny.
2. Zapisz commit lub tag, z którego pochodzi wzorzec.
3. Kopiuj najmniejszy potrzebny fragment, nie całe demo.
4. Sprawdź osobno licencję assetów i zależności.
5. Dodaj reduced motion, fallback bez GPU, limity DPR i zatrzymanie render loop poza viewportem.
6. Dla parallax i smooth scroll sprawdź klawiaturę, dotyk, focus i natywną nawigację.
