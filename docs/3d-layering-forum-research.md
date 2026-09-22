# Badanie forów: 3D, 2.5D i warstwowa głębia

Stan weryfikacji: 2026-09-22. Ten dokument zapisuje źródła praktyk użytych w `knowledge/visual-depth-layering.md`. Wątki forum są materiałem doświadczeniowym, nie licencją na kopiowanie pokazywanych realizacji, kodu ani assetów.

## Metoda

- Szukano dyskusji praktyków opisujących realne implementacje warstw obrazowych, parallaxu, DOM + WebGL, ScrollTrigger i problemy wydajnościowe.
- Regułę przyjmowano, gdy była poparta konkretnym przypadkiem, odpowiedzią moderatora/maintainera albo powtarzała się w więcej niż jednej społeczności.
- Pojedyncze opinie estetyczne zapisano jako sygnał ryzyka, nie fakt techniczny.
- Ograniczenia renderowania sprawdzono później w dokumentacji W3C i Three.js; nie zastępują one badania forum.

## Three.js Forum

### Warstwowe planes i koszt tekstur

[Three.js app performance — point & click game](https://discourse.threejs.org/t/three-js-app-performance-point-click-game/18491), 2020.

Projekt używał kilku płaszczyzn obrazowych, shaderów i przezroczystych PNG do parallaxu. Odpowiedź maintainera wskazała fragment-shader bottleneck oraz zbyt wysokie rozdzielczości tekstur jako źródło problemu. Wniosek dla bazy: liczba obiektów nie opisuje kosztu sceny; pełnoekranowe piksele, overdraw, rozdzielczość i alpha mogą dominować.

### Duże obrazy i upload do GPU

[Help with large images](https://discourse.threejs.org/t/help-with-large-images/60329), 2024.

Przy wielu nakładanych warstwach obrazu problemy powstawały podczas dekodowania i pierwszego uploadu tekstury. Rekomendowano `ImageBitmapLoader` oraz KTX2; autor potwierdził znacząco niższe użycie pamięci GPU po KTX2. Wniosek: preload, format GPU i pamięć po dekompresji są częścią planu warstw.

### Hybryda DOM + WebGL

[3D Scroll-Based Product Landing-Page](https://discourse.threejs.org/t/3d-scroll-based-product-landing-page/29309), 2021.

Autor oddzielił Three.js od elementów HTML/CSS nakładanych nad i pod canvasem. Feedback użytkowników wskazał dwa realne problemy: zbyt szybki scroll pomijał sceny, a opóźnione zasoby powodowały nakładanie tekstów; różnice między kółkiem Windows i trackpadem Mac zmieniały odbiór. Wniosek: 3D jest warstwą strony, natywny input trzeba testować na kilku urządzeniach, a layout nie może zależeć od gotowości sceny.

### Depth map jako alternatywa dla wielu ręcznych planów

[Layered Depth Effect Experiment](https://discourse.threejs.org/t/layered-depth-effect-experiment/84892), 2025.

Eksperyment wykorzystuje mapę głębi do zbudowania pasm warstwowych z jednego obrazu. Jest to dowód istnienia techniki, nie zatwierdzony komponent. Wniosek: mapa głębi może być osobną ścieżką WebGL, ale sama mapa, obraz, shader i sposób ruchu nadal wymagają provenance.

### Zestaw wielu płaskich obrazów w osi Z

[Raycasting planes](https://discourse.threejs.org/t/raycasting-planes-returns-an-empty-array-what-am-i-doing-wrong/48350), 2023.

Praktyczny przykład rozdziela środowisko na wiele PNG ustawionych w osi Z i osobne warstwy interaktywne. Wniosek: renderowana warstwa i hit target nie powinny być utożsamiane; interakcje należy mapować jawnie i testować na przezroczystych obszarach.

## GSAP Community

### Jedna orkiestracja i diagnoza bez animacji

[Trying to use ScrollTrigger after the completion of previous ScrollTrigger](https://gsap.com/community/forums/topic/38085-trying-to-use-scrolltrigger-after-the-completion-of-previous-scrolltrigger/), 2023.

Moderator zalecił jedną sekwencję ScrollTrigger dla następujących po sobie zmian. Administrator zdiagnozował błędny ogromny scale i absolutne pozycjonowanie przez wyłączenie ScrollTrigger oraz animacji. Wniosek: warstwy muszą korzystać ze wspólnego postępu, a QA zawsze zaczyna się od statycznego layoutu.

### Trigger nie powinien animować własnej geometrii

[Problem with ScrollTrigger Start](https://gsap.com/community/forums/topic/42906-problem-with-scrolltrigger-start/), 2024.

W odpowiedzi forum wskazano, aby nie używać tego samego elementu jako triggera i animowanego celu. Wniosek: stabilna rama sceny wyznacza zakres, a ruchome plany są jej potomkami.

## Webflow Forum

### Maskowany obraz i dwa współpracujące transformy

[How to get background images to parallax move](https://discourse.webflow.com/t/how-to-get-background-images-to-parallax-move/127711), 2020.

Analiza przykładu opisywała zagnieżdżone divy: osobny ruch ramy i obrazu, `translate3d`, scale oraz maskę/overflow. Wniosek: kadr, maska i poruszany asset są odrębnymi odpowiedzialnościami, a nie jednym elementem z przypadkowymi stylami.

### Rzeczywisty parallax to różna prędkość warstw

[Background layer that moves at a different pace](https://discourse.webflow.com/t/background-layer-that-also-moves-up-at-different-pace-triggered-by-scroll-parallax/3129), 2014, oraz [The effects of elements movement when scrolling](https://discourse.webflow.com/t/the-effects-of-the-elements-of-movement-when-scrolling/35381), 2016.

Społeczność rozróżniała parallax warstwowy od samego `background-attachment: fixed`. Wniosek: iluzja głębi wymaga relacji prędkości co najmniej dwóch planów; fixed background sam w sobie nie jest modelem warstwowym.

### Obraz większy niż obszar wyświetlania

[Parallax Laggy Scroll](https://discourse.webflow.com/t/parallax-laggy-scroll/86633/4), 2019.

Forum zidentyfikowało obraz o szerokości ponad 5000 px wyświetlany w obszarze około 160 px jako bezpośrednią przyczynę lagów; po zmianie realnego rozmiaru problem zniknął. Wniosek: metadane DPI nie rozwiązują wydajności, liczy się liczba pikseli, transfer i docelowy rozmiar.

### Ryzyko platform i mobile

[Different Parallax effects possible with Webflow](https://discourse.webflow.com/t/different-parallax-effects-possible-with-webflow-no-custom-code-required/25339), 2016, oraz [Parallax Scroll does not work correctly on Safari](https://discourse.webflow.com/t/parallax-scroll-does-not-work-correctly-on-safari/135473), 2020.

Wątki dokumentują różnice Safari/iOS i brak zgodności części technik fixed-background na urządzeniach mobilnych. Wniosek: mobile potrzebuje jawnego, spłaszczonego wariantu zamiast założenia, że desktopowy efekt zadziała identycznie.

## Społeczność projektantów stron

[Is parallax visually appealing or a usability issue?](https://www.reddit.com/r/web_design/comments/1fr0uxj), 2024.

Najczęściej powtarzający się pogląd: parallax działa, gdy wspiera storytelling i kieruje uwagę; użyty bez celu łatwo staje się dezorientujący, ciężki i niedostępny. Jest to podstawa reguły celu narracyjnego, nie źródło parametrów technicznych.

[When is too much parallax too much?](https://www.reddit.com/r/web_design/comments/dpq9oi), 2019.

Dyskusja krytykuje parallax i blur zastosowane na każdej podstronie, wskazując gorszą czytelność obrazów, nudności i spadek wydajności. Wniosek: jedna dominująca scena jest lepsza niż stały efekt na całym serwisie.

## Synteza obowiązująca w repozytorium

Z powyższych forów wynikają reguły przyjęte w standardzie:

1. Interfejs i warstwa immersyjna są rozdzielone.
2. Każda scena ma jedną stabilną ramę i jedno źródło postępu.
3. Głębia wynika z relacji planów, nie z samego fixed background lub mocnego blur.
4. Warstwy, maski, blur copies i hit targets mają osobne provenance oraz odpowiedzialności.
5. Piksele, alpha, overdraw, dekodowanie i upload tekstur są częścią budżetu projektu.
6. Statyczny layout testuje się przed motion, a ciężką scenę stopniowo dokłada warstwa po warstwie.
7. Mobile, reduced motion i brak WebGL mają kompletny, statyczny wariant.
8. Efekt nie może przejąć scrolla, ukryć treści ani zastąpić podstawowego interfejsu.

## Techniczna kontrola w dokumentach źródłowych

- [W3C CSS Transforms 2](https://www.w3.org/TR/css-transforms-2/) potwierdza model wspólnego kontekstu 3D i właściwości powodujące flattening.
- [W3C Scroll-driven Animations](https://www.w3.org/TR/scroll-animations-1/) rozróżnia scroll progress i view progress oraz opisuje mapowanie animacji na skończony zakres.
- [W3C Filter Effects 1](https://www.w3.org/TR/filter-effects-1/) potwierdza, że filtr tworzy stacking context i jest stosowany do zrenderowanej grupy.
- [W3C CSS Will Change](https://www.w3.org/TR/css-will-change/) przestrzega przed globalnym i trwałym `will-change`.
- [Three.js WebGLRenderer](https://threejs.org/docs/pages/WebGLRenderer.html) dokumentuje DPR, pętlę animacji i cleanup renderera.
