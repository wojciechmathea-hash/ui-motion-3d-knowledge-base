# Third-party notices

Stan zweryfikowany: 2026-09-21. Ten dokument jest praktycznym rejestrem pochodzenia, a nie poradą prawną. Wiążące są licencje umieszczone w źródłowych repozytoriach i warunki serwisów.

## ThreeUI Community

- Strona: https://threeui.com/browse
- Repozytorium: https://github.com/MengTo/threeui
- Lokalnie: `upstream/threeui`
- Kod aplikacji i komponenty Community: MIT.
- Fonty: SIL Open Font License 1.1.
- Bundled Three.js runtime: MIT.
- Zewnętrzne miniatury i podglądy ładowane z `threeui.com` nie są objęte licencją repozytorium i nie są kopiowane.
- Kod i assety Pro/Beta nie są częścią publicznego upstreamu.

Zobacz pliki `LICENSE`, `ASSET-LICENSES.md`, `FONT-LICENSES.md` i `THIRD_PARTY_NOTICES.md` w submodule.

## Anime.js

- Strona: https://animejs.com
- Repozytorium: https://github.com/juliangarnier/anime
- Lokalnie: `upstream/animejs`
- Licencja: MIT.

Zobacz `upstream/animejs/LICENSE.md`.

## Magic UI Free

- Oficjalna dokumentacja: https://magicui.design/docs
- Repozytorium: https://github.com/magicuidesign/magicui
- Lokalnie: `upstream/magicui`
- Licencja: MIT.

`magicui.net` jest zewnętrznym serwisem discovery/affiliate. Nie jest źródłem kodu w tym repozytorium.

## Magic UI Pro

- Strona: https://pro.magicui.design
- Warunki: https://pro.magicui.design/license
- Kod i assety Pro nie są przechowywane w tym repozytorium.
- Licencja nabywcy dopuszcza użycie w produktach osobistych i komercyjnych, ale zabrania redystrybucji, odsprzedaży, udostępniania lub transferu produktu w wersji oryginalnej i zmodyfikowanej.

## React Bits

- Strona: https://reactbits.dev
- Repozytorium: https://github.com/DavidHDev/react-bits
- Lokalnie: `upstream/react-bits`
- Licencja: MIT + Commons Clause License Condition v1.0.
- Dozwolone jest użycie w aplikacji, stronie lub produkcie, także komercyjnym.
- Zabroniona jest sprzedaż, sublicencjonowanie lub redystrybucja samych komponentów, osobno, w bundle’u lub jako port.

Submoduł jest odnośnikiem do oficjalnego upstreamu; to repo nie publikuje osobnego mirroru ani paczki React Bits.

## 21st.dev

- Marketplace: https://21st.dev
- Warunki: https://21st.dev/terms
- Oficjalne narzędzie: https://github.com/21st-dev/skill
- Lokalnie: `upstream/21st-skill`
- Narzędzie: Apache-2.0.
- Elementy marketplace’u: prawa i licencje zależą od autora konkretnego elementu.
- Warunki serwisu zabraniają automatycznego scrapowania oraz kopiowania demo, preview, screenshotów, GIF-ów, filmów i miniaturek.

W tej bazie 21st.dev działa w trybie `reference-only`: wyszukiwanie wyłącznie oficjalnym interfejsem/API/CLI, a import dopiero po zapisaniu licencji konkretnego komponentu.

## Dodatkowe przypięte upstreamy

Poniższe otwarte repozytoria są dostępne w `upstream/curated/` jako submoduły. Każdy wskazany plik licencji pozostaje częścią upstreamu.

| Projekt | Lokalna ścieżka | Licencja |
|---|---|---|
| shadcn/ui | `upstream/curated/shadcn-ui` | MIT |
| daisyUI | `upstream/curated/daisyui` | MIT; płatne motywy i template’y są wyłączone |
| HyperUI | `upstream/curated/hyperui` | MIT |
| Kokonut UI | `upstream/curated/kokonutui` | MIT |
| Motion | `upstream/curated/motion` | MIT; płatne materiały Motion+ są wyłączone |
| AutoAnimate | `upstream/curated/auto-animate` | MIT |
| React Three Fiber | `upstream/curated/react-three-fiber` | MIT |
| Drei | `upstream/curated/drei` | MIT; assety demonstracyjne wymagają osobnej kontroli |
| Leva | `upstream/curated/leva` | MIT |
| TanStack Table | `upstream/curated/tanstack-table` | MIT |
| Tabler Icons | `upstream/curated/tabler-icons` | MIT |

## Źródła katalogowe bez lokalnego mirroru

Pozostałe darmowe źródła są indeksowane jako oficjalne linki. Obejmuje to m.in. Radix Primitives, Base UI, Flowbite, Mantine, React Spring, tsParticles, Three.js, Babylon.js, Recharts, Apache ECharts, visx, Chart.js, Grid.js, Tremor, Lucide, Heroicons, Phosphor Icons oraz biblioteki assetów 3D.

- Theatre.js ma rozdzielone warunki: core jest Apache-2.0, a Studio AGPL-3.0.
- Poly Haven publikuje assety jako CC0; nie wolno jednak scrapować witryny. Używany ma być oficjalny interfejs lub API.
- Khronos glTF Sample Assets ma licencje mieszane zależne od modelu.
- Babylon.js Assets jest domyślnie CC-BY-4.0, ale katalogi mogą mieć wyjątki.

Pełna lista i precyzyjne reguły znajdują się w `catalog/source-registry.json` i `docs/free-source-directory.md`.

## Generatory

Generatory są przechowywane wyłącznie jako metadane i oficjalne linki w `catalog/generator-registry.json`; ich programy, modele i wyniki nie są automatycznie kopiowane.

- Open-source aplikacja nie nadaje swojej licencji modelom, checkpointom, LoRA, custom nodes ani materiałom wejściowym.
- Bezpłatny plan SaaS może mieć publiczne wyniki, watermark, jednorazowe kredyty albo zmienny limit.
- Paid/Pro credits, modele, template’y i funkcje są wyłączone.
- Wynik o niejasnych prawach ma status `do-not-import`.

Opis zastosowań i ograniczeń znajduje się w `docs/generator-directory.md`.

## Repozytoria edukacyjne

Repozytoria UI/UX, efektów webowych, WebGL i parallax są indeksowane jako oficjalne linki w `catalog/learning-repository-registry.json`. Licencja repozytorium obejmuje wskazany kod lub dokumentację, lecz nie musi obejmować assetów demonstracyjnych. Nie są tworzone pełne mirrory tych repozytoriów.
