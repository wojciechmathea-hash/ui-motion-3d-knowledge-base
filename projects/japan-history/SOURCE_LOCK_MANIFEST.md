# Source-lock manifest — Japan History

Status: zamknięty przed implementacją. Projekt adaptuje jeden kompletny komponent źródłowy i nie wprowadza autorskiej warstwy wizualnej.

## Główna rodzina wizualna

| Pole | Wartość |
|---|---|
| Registry ID | `threeui` |
| Nazwa systemu / biblioteki | ThreeUI Community — Kage Landing Page |
| Dokładny upstream path | `upstream/threeui/public/landing-pages/kage.html` oraz `upstream/threeui/public/landing-pages/secret-pathways-assets/**` |
| URL | https://threeui.com/browse |
| Repozytorium | https://github.com/MengTo/threeui |
| Commit / wersja | `68802d5428071ada5c20db8094b1649e6bb770ed` |
| Licencja | MIT; fonty OFL-1.1; bundled Three.js MIT |
| Użyte tokeny / motyw źródłowy | niezmieniona nocna paleta Kage, typografia, layout, responsive rules i motion |

## Mapa elementów

| Obszar / selektor | Element lub komponent | Registry ID | Upstream: dokładny plik / eksport | URL | Commit / wersja | Licencja | Dozwolona adaptacja | Provenance record |
|---|---|---|---|---|---|---|---|---|
| cały dokument | Kage full-page layout, tokeny, breakpointy i fallback | `threeui` | `public/landing-pages/kage.html` | https://github.com/MengTo/threeui | `68802d5` | MIT | podmiana treści, tytułu, języka i działających linków; bez zmiany geometrii i stylu | `provenance/threeui-kage.json` |
| `#nav`, `.nav-links`, `.nav-burger` | źródłowa nawigacja desktop/mobile | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | polskie etykiety i kotwice do istniejących sekcji | `provenance/threeui-kage.json` |
| `.hero`, `.chapters`, `.peek`, `.word-fb` | hero, chapter chips, live preview i fallback wordmark | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | prawdziwa treść historii Japonii | `provenance/threeui-kage.json` |
| `#gate`, `#pathways`, `#lessons`, `#eternity`, `.foot` | cztery rozdziały, cards, atlas epok, CTA i stopka | `threeui` | `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | treść, daty, źródła i etykiety | `provenance/threeui-kage.json` |
| `#c`, `[data-frame]`, `#rail`, `#fg-sky` | renderer WebGL, kamera, post-processing, scroll mapping, rail i foreground staging | `threeui` | inline script w `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | wyłącznie zmiana słowa sceny `KAGE` na `JPN` i nazw dostępności rozdziałów; algorytm oraz ruch bez zmian | `provenance/threeui-kage.json` |
| `.fg-*` | 10 transparentnych planów: basalt, bush, hill, maple, pine, sakura, ruins, lantern, grass, wall | `threeui` | `public/landing-pages/secret-pathways-assets/foreground/png/*.webp` | jw. | `68802d5` | MIT | brak zmian, źródłowe kadrowanie i staging | `provenance/threeui-kage.json` |
| fallback cards | 4 source-authored scene images | `threeui` | `public/landing-pages/secret-pathways-assets/generated/*.webp` | jw. | `68802d5` | MIT | brak zmian | `provenance/threeui-kage.json` |
| `@font-face`, `.display`, `.body`, `.jp` | Onest, Instrument Serif, Newsreader i font fallback | `threeui` | `public/landing-pages/secret-pathways-assets/fonts.css` | jw. | `68802d5` | OFL-1.1 | brak modyfikacji fontów | `provenance/threeui-kage.json` |
| `<svg>` i `.cur-dot` | źródłowy znak, menu, arrows, play icon i cursor | `threeui` | inline w `public/landing-pages/kage.html` | jw. | `68802d5` | MIT | brak zmian geometrii | `provenance/threeui-kage.json` |
| treść historyczna i źródła | polskie streszczenie zweryfikowanych faktów | `threeui` jako kontener treści | istniejące sloty tekstowe Kage | źródła wymienione w `BRIEF.md` | weryfikacja `2026-09-22` | tekst własny oparty na faktach; linkowane źródła | dopasowanie długości bez tworzenia nowych modułów | `provenance/content-sources.json` |

## Niewizualny kod integracyjny

| Plik | Zakres techniczny | Dlaczego nie tworzy nowego elementu wizualnego |
|---|---|---|
| `index.html` | treść, kotwice, metadane, ścieżki do skopiowanych lokalnych assetów | wszystkie style, layout, SVG, efekty i ruch pochodzą z kompletnego `kage.html` |

## Warstwy głębi i 3D

- [x] Stabilna warstwa semantycznego UI pozostaje w DOM nad sceną.
- [x] Każdy plan, proceduralna tekstura, post-processing i fallback należy do kompletnego Kage i rekordu provenance.
- [x] Mapowanie scrolla, kursora, okluzji oraz reduced motion jest bez zmian względem Kage.
- [x] Mobile i `no-webgl` korzystają ze źródłowych wariantów.

Szczegóły: `VISUAL_LAYER_STACK.md`.

## Kontrola przed implementacją

- [x] 100% elementów widocznych i interaktywnych należy do kompletnego komponentu Kage.
- [x] Nie ma wpisu `local-original` ani źródła `reference-only`.
- [x] Nie ma autorskich dekoracji, gradientów, figur, teł, ikon, ilustracji, ruchu ani układów agenta.
- [x] Nie użyto generowanych ad hoc assetów.
- [x] Jedna główna rodzina zapewnia spójność całej strony.
- [x] Adaptacja obejmuje tylko prawdziwą treść, metadane, dostępność i linki.

## Kontrola po implementacji

- [x] Audyt DOM i CSS nie wykazał elementów spoza manifestu.
- [x] Fallback `no-webgl` i reduced motion są zachowane bez zmian względem źródła.
- [x] Licencje i rekordy provenance znajdują się w projekcie.
