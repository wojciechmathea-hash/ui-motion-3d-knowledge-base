# Source-lock manifest — Kosmos w skali

## Główna rodzina wizualna

| Pole | Wartość |
|---|---|
| Registry ID | `threeui` |
| Nazwa systemu / biblioteki | ThreeUI Community — Kage Landing Page |
| Dokładny upstream path | `upstream/threeui/public/landing-pages/kage.html` |
| URL | https://github.com/MengTo/threeui |
| Commit / wersja | `68802d5428071ada5c20db8094b1649e6bb770ed` |
| Licencja | MIT; fonty osobno OFL-1.1 |
| Użyte tokeny / motyw źródłowy | niezmienna nocna paleta, layout, typografia, cards, rail, responsive rules i motion Kage |

## Uzasadniony system dodatkowy

`react-bits / Galaxy` zastępuje wyłącznie źródłowy canvas sanktuarium w tym samym pełnoekranowym slocie tła. Jest potrzebny, ponieważ motyw wymaga pola gwiazd bez modeli i brył, czego komplet Kage nie zapewnia. Nie wprowadza osobnej siatki, typografii ani języka interfejsu. Runtime OGL jest wyłącznie zależnością renderera. Media NASA wchodzą tylko do istniejących slotów obrazowych.

## Mapa elementów

| Obszar / selektor | Element lub komponent | Registry ID | Upstream: dokładny plik / eksport | URL | Commit / wersja | Licencja | Dozwolona adaptacja | Provenance record |
|---|---|---|---|---|---|---|---|---|
| cały dokument | Kage full-page layout, tokeny, breakpointy i typografia | `threeui` | `public/landing-pages/kage.html` | https://github.com/MengTo/threeui | `68802d5` | MIT / OFL-1.1 | treść, działające linki, lokalne media, pominięcie sanktuarium | `provenance/threeui-kage-layout.json` |
| `#nav`, `.nav-links`, `.nav-burger` | nawigacja desktop/mobile | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | polskie etykiety i kotwice | `provenance/threeui-kage-layout.json` |
| `.hero`, `.chapters`, `.peek`, `.word-fb` | hero, chips, podgląd i fallback wordmark | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | treść kosmiczna i lokalny obraz w istniejącym slocie | `provenance/threeui-kage-layout.json` |
| `#gate`, `#pathways`, `#lessons`, `#eternity`, `.foot` | cztery rozdziały, cards, atlas i stopka | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | prawdziwa treść i źródła | `provenance/threeui-kage-layout.json` |
| `#rail`, reveal, aktywna sekcja, menu | źródłowe zachowania dokumentu | `threeui` | page wiring w `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | integracja bez zmiany czasów i logiki stanów | `provenance/threeui-kage-layout.json` |
| `#cosmos`, canvas | React Bits Galaxy | `react-bits` | `src/content/Backgrounds/Galaxy/Galaxy.jsx` i `.css` | https://github.com/DavidHDev/react-bits | `9481af758aae6cfb34c3652ec40a1c099360331f` | MIT + Commons Clause v1.0 | bundling jako część strony, parametry props, reduced motion | `provenance/react-bits-galaxy.json` |
| runtime Galaxy | OGL Renderer, Program, Mesh, Color, Triangle | `ogl` | pakiet `ogl@1.0.11` | https://github.com/oframe/ogl | `1.0.11` | Unlicense | minifikacja w aplikacyjnym bundle | `provenance/ogl-runtime.json` |
| `.peek`, karta 01 | Earthrise | `nasa-media` | oficjalny download 1900×1200 | https://science.nasa.gov/resource/image-earthrise/ | pobrano `2026-09-22` | NASA Media Usage Guidelines | kadr `object-fit: cover`, opis i kredyt | `provenance/nasa-media.json` |
| karta 02 | Solar System banner | `nasa-media` | oficjalny download 1920×640 | https://science.nasa.gov/solar-system/ | pobrano `2026-09-22` | NASA Media Usage Guidelines | kadr `object-fit: cover`, opis i kredyt | `provenance/nasa-media.json` |
| karta 03 | Our Galaxy | `nasa-media` | oficjalny download 2000×2630 | https://science.nasa.gov/asset/webb/our-galaxy/ | pobrano `2026-09-22` | NASA Media Usage Guidelines | kadr `object-fit: cover`, opis i kredyt | `provenance/nasa-media.json` |
| fallback / finał | Pillars of Creation, MIRI | `nasa-media` | oficjalny download 1987×1817 | https://science.nasa.gov/asset/webb/pillars-of-creation-miri-image/ | pobrano `2026-09-22` | NASA Media Usage Guidelines; kredyt NASA/ESA/CSA/STScI | statyczne tło fallback i istniejący slot obrazu | `provenance/nasa-media.json` |
| treść naukowa | polskie streszczenie faktów | `nasa-media` jako źródło informacji | oficjalne strony NASA wskazane w stopce | https://science.nasa.gov/ | weryfikacja `2026-09-22` | tekst własny oparty na faktach | dopasowanie długości do slotów Kage | `provenance/content-sources.json` |

## Niewizualny kod integracyjny

| Plik | Zakres techniczny | Dlaczego nie tworzy nowego elementu wizualnego |
|---|---|---|
| `index.html` | treść, kotwice, aria, podłączenie lokalnych assetów i bundle | geometria, layout i motion pochodzą z Kage; tło z Galaxy |
| `src/galaxy-entry.jsx` | montaż komponentu, parametry i `prefers-reduced-motion` | nie zmienia shadera ani geometrii komponentu |
| `src/page-wiring.js` | menu, rail, observer i aktywna sekcja | adaptacja źródłowego page wiring Kage |

## Warstwy głębi i 3D

- [x] Stabilna warstwa semantycznego UI pozostaje niezależna od Galaxy.
- [x] Canvas Galaxy, zdjęcia i fallback mają osobne rekordy źródłowe.
- [x] Pointer, reveal, scroll rail i reduced motion pochodzą z komponentów źródłowych.
- [x] Mobile usuwa rail zgodnie ze źródłowym breakpointem Kage; treść pozostaje pełna.

## Kontrola przed implementacją

- [x] 100% elementów widocznych i interaktywnych ma rekord źródłowy.
- [x] Nie ma wpisu `local-original` ani źródła `reference-only`.
- [x] Nie ma autorskich dekoracji, figur, modeli ani nowych układów.
- [x] Nie użyto generatora ani assetu bez provenance.
- [x] ThreeUI Kage pozostaje główną rodziną kompozycyjną.
- [x] Galaxy pokrywa jedną brakującą funkcję i nie wprowadza konkurencyjnych tokenów.
- [x] Adaptacja ogranicza się do treści, źródłowych parametrów, dostępności i integracji.

## Kontrola po implementacji

- [x] Audyt DOM i CSS nie wykazał elementów spoza manifestu.
- [x] Fallback pozostaje kompletną, statyczną treścią.
- [x] Projekt nie traktuje wcześniejszej realizacji jako źródła.
- [x] Provenance i licencje są kompletne.
