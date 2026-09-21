# Katalog darmowych źródeł

Stan weryfikacji: 2026-09-21. Katalog obejmuje wyłącznie darmowe warstwy produktów i projekty open source. Oznaczenie „lokalnie” znaczy, że oficjalne repozytorium jest przypięte jako submoduł; „link” oznacza użycie oficjalnej strony lub repozytorium bez tworzenia lokalnego mirroru.

## UI, motywy i komponenty

| Źródło | Najlepsze zastosowanie | Licencja darmowej warstwy | Tryb |
|---|---|---|---|
| [shadcn/ui](https://ui.shadcn.com) | Komponenty React/Tailwind kopiowane do projektu | MIT | lokalnie |
| [daisyUI](https://daisyui.com) | Semantyczne klasy, szybkie motywy Tailwind | MIT | lokalnie; bez płatnych motywów |
| [Flowbite](https://flowbite.com) | Gotowe komponenty i dashboardy Tailwind | MIT | link; bez Pro |
| [HyperUI](https://www.hyperui.dev) | Sekcje marketingowe i e-commerce | MIT | lokalnie |
| [Radix Primitives](https://www.radix-ui.com/primitives) | Dostępne, headless prymitywy React | MIT | link |
| [Base UI](https://base-ui.com) | Headless komponenty React do własnego design systemu | MIT | link |
| [Mantine](https://mantine.dev) | Pełny zestaw React, formularze i hooki | MIT | link; bez płatnych dodatków |
| [Cult UI](https://www.cult-ui.com) | Kreatywne komponenty z animacją | MIT | link |
| [Kokonut UI](https://kokonutui.com) | Copy-paste React/Tailwind i mikrointerakcje | MIT | lokalnie |
| [Inspira UI](https://inspira-ui.com) | Efektowne komponenty Vue/Nuxt | MIT | link |

Oryginalne źródła UI — Magic UI, React Bits, 21st.dev i darmowy publiczny template powiązany z Magic UI Pro — zachowują reguły opisane w `THIRD_PARTY_NOTICES.md`. Warstwy Pro pozostają wyłączone.

## Źródła referencyjne i darmowe materiały procesowe

| Źródło | Darmowy zakres | Status w bazie |
|---|---|---|
| [HorizonX](https://horizonx.so) | Vibe Coding UI Specification jest jawnie bezpłatna do kopiowania i adaptacji; publiczna checklista jakości jest darmowym narzędziem | `reference-only`; 0 zatwierdzonych darmowych komponentów, ponieważ biblioteka i eksporty wymagają subskrypcji |

Szczegółowa weryfikacja HorizonX znajduje się w `docs/horizonx-free-surface.md`. Publiczny podgląd interaktywnego komponentu nie jest bezpłatnym komponentem i nie może trafić do projektu.

## Motion i efekty

| Źródło | Najlepsze zastosowanie | Licencja | Tryb |
|---|---|---|---|
| [Motion](https://motion.dev) | Animacje React/JS, layout, gesty i scroll | MIT | lokalnie; bez Motion+ |
| [AutoAnimate](https://auto-animate.formkit.com) | Automatyczne przejścia przy zmianach DOM | MIT | lokalnie |
| [React Spring](https://www.react-spring.dev) | Animacje fizyczne w React i R3F | MIT | link |
| [tsParticles](https://particles.js.org) | Particles, interaktywne tła i canvas | MIT | link |
| [Anime.js](https://animejs.com) | Timeline, SVG, DOM, Canvas i Three.js | MIT | lokalnie |

## 3D, WebGL i narzędzia kreatywne

| Źródło | Najlepsze zastosowanie | Licencja | Tryb |
|---|---|---|---|
| [Three.js](https://threejs.org) | Bazowy renderer WebGL/WebGPU | MIT | link |
| [React Three Fiber](https://r3f.docs.pmnd.rs/getting-started/introduction) | Deklaratywne sceny Three.js w React | MIT | lokalnie |
| [Drei](https://drei.docs.pmnd.rs/getting-started/introduction) | Helpers dla React Three Fiber | MIT | lokalnie; assety demo osobno |
| [Babylon.js](https://www.babylonjs.com) | Pełny silnik 3D/WebGPU | Apache-2.0 | link |
| [postprocessing](https://pmndrs.github.io/postprocessing/public/docs/) | Efekty post-processingu w Three.js | Zlib | link |
| [Leva](https://leva.pmnd.rs) | Panele parametrów do strojenia scen i shaderów | MIT | lokalnie |
| [Theatre.js](https://www.theatrejs.com) | Timeline i animowanie parametrów | core Apache-2.0; Studio AGPL-3.0 | link z kontrolą części |
| [ThreeUI](https://threeui.com/browse) | Gotowe efekty, shadery i sceny Community | MIT z wyjątkami dla assetów/fontów | lokalnie; bez Pro/Beta |

## Tabele i wizualizacja danych

| Źródło | Najlepsze zastosowanie | Licencja | Tryb |
|---|---|---|---|
| [TanStack Table](https://tanstack.com/table/latest) | Headless tabele, sortowanie, filtry i paginacja | MIT | lokalnie |
| [Glide Data Grid](https://grid.glideapps.com) | Bardzo duże, edytowalne gridy canvas | MIT | link |
| [Grid.js](https://gridjs.io) | Lekka tabela niezależna od frameworka | MIT | link |
| [Recharts](https://recharts.org) | Kompozycyjne wykresy React/SVG | MIT | link |
| [Apache ECharts](https://echarts.apache.org) | Rozbudowane interaktywne wykresy, mapy i duże dane | Apache-2.0 | link |
| [visx](https://airbnb.io/visx) | Niskopoziomowe prymitywy React + D3 | MIT | link |
| [Chart.js](https://www.chartjs.org) | Proste, responsywne wykresy canvas | MIT | link |
| [Tremor](https://www.tremor.so) | Dashboardy React i komponenty danych | Apache-2.0 | link; bez płatnych dodatków |

Zasady wyboru, dostępności i degradacji są w `knowledge/data-visualization.md`.

## Ikony i assety wizualne

| Źródło | Zawartość | Licencja | Tryb |
|---|---|---|---|
| [Tabler Icons](https://tabler.io/icons) | Spójny zestaw ikon SVG | MIT | lokalnie |
| [Lucide](https://lucide.dev) | Ikony SVG i integracje frameworkowe | ISC | link |
| [Heroicons](https://heroicons.com) | Ikony dopasowane do ekosystemu Tailwind | MIT | link |
| [Phosphor Icons](https://phosphoricons.com) | Ikony w wielu wagach | MIT | link |
| [Poly Haven](https://polyhaven.com) | HDRI, tekstury i modele 3D | CC0 | oficjalny UI/API; bez scrapingu |
| [Khronos glTF Sample Assets](https://github.com/KhronosGroup/glTF-Sample-Assets) | Modele referencyjne glTF | mieszane, per model | wybór po weryfikacji pliku |
| [Babylon.js Assets](https://github.com/BabylonJS/Assets) | Modele, tekstury i sceny demonstracyjne | domyślnie CC-BY-4.0, możliwe wyjątki | wybór po weryfikacji katalogu |

## Procedura importu

1. Wybierz źródło w `catalog/source-registry.json` i upewnij się, że `inclusion` nie jest `reference-only`.
2. Otwórz licencję z przypiętego submodułu albo oficjalnego repozytorium.
3. Dla assetów sprawdź licencję konkretnego pliku, modelu, fontu, tekstury lub HDRI.
4. Zapisz URL, autora, wersję/commit, licencję, datę i modyfikacje według `templates/component-record.json`.
5. Nie kopiuj materiałów Pro, miniaturek, podglądów, brandingu ani treści marketingowych.

Prywatność repozytorium nie zastępuje licencji. Źródło bez jasnej licencji pozostaje wyłącznie inspiracją i linkiem.
