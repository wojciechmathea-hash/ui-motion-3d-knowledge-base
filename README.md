# UI Motion 3D Knowledge Base

Prywatna, agent-friendly baza wiedzy do projektowania i budowania interfejsów: komponenty UI, animacje, mikrointerakcje, shadery, WebGL, sceny 3D, tabele, wykresy i darmowe assety wizualne.

Repozytorium porządkuje wskazane źródła, zachowuje ich pochodzenie i licencje oraz podpina otwarte implementacje jako submoduły Git. Nie jest kopią serwisów ani marketplace’em.

Wszystkie rezultaty powstają według jednej nadrzędnej instrukcji: [CREATION_STANDARD.md](CREATION_STANDARD.md).

## Co znajduje się w repozytorium

| Obszar | Zawartość |
|---|---|
| `CREATION_STANDARD.md` | Jedyna nadrzędna instrukcja tworzenia treści, stron, prezentacji, UI i komponentów |
| `catalog/` | Rejestry źródeł, generatorów, fontów, inspiracji i repozytoriów edukacyjnych oraz generowane indeksy |
| `docs/` | Taksonomia, przewodnik wyboru, licencje i workflow pracy |
| `knowledge/` | Reguły kompozycji UI, motion i 3D/WebGL |
| `projects/` | Gotowe realizacje budowane zgodnie z nadrzędnym standardem |
| `templates/` | Szablon rekordu komponentu z pełnym provenance |
| `tools/` | Aktualizacja submodułów, generowanie indeksu i walidacja |
| `upstream/` | Przypięte wersje wybranych otwartych repozytoriów źródłowych |
| `AGENTS.md` | Instrukcje dla agentów AI korzystających z bazy |

## Źródła

- [ThreeUI](https://threeui.com/browse) — Community: komponenty 3D, WebGL i shadery; pełne otwarte źródło jako submoduł.
- [Anime.js](https://animejs.com) — silnik animacji oraz przykłady CSS, SVG, DOM, Canvas i Three.js.
- [Magic UI Pro](https://pro.magicui.design) — wyłącznie indeks funkcji i odnośniki; płatny kod i assety nie są kopiowane.
- [magicui.net](https://magicui.net) — źródło discovery kierujące do oficjalnego, bezpłatnego [Magic UI](https://magicui.design); otwarte repo Magic UI jest submodułem.
- [21st.dev](https://21st.dev) — używany przez oficjalne narzędzie i linki; marketplace nie jest scrapowany, a licencja jest sprawdzana osobno dla każdego komponentu.
- [React Bits](https://reactbits.dev) — indeks i przypięty upstream; kod wolno wykorzystywać w produktach, ale nie redystrybuować jako bibliotekę komponentów.

Szczegółowy stan prawny i techniczny jest opisany w [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) oraz [docs/licensing.md](docs/licensing.md).

## Rozszerzony katalog darmowych źródeł

Rejestr obejmuje teraz 42 źródła. Oprócz sześciu źródeł bazowych zawiera 36 zweryfikowanych pozycji z obszarów UI i motywów, motion, 3D/WebGL, tabel i wizualizacji danych oraz ikon i assetów 3D. Jedenaście reprezentatywnych projektów jest przypiętych jako dodatkowe submoduły, a cięższe kolekcje pozostają bezpiecznymi linkami do oficjalnych stron.

Pełny, pogrupowany indeks z licencjami, zastosowaniami i ograniczeniami znajduje się w [docs/free-source-directory.md](docs/free-source-directory.md).

## Rejestry generatorów, nauki, inspiracji, fontów i koloru

Baza zawiera także pięć niezależnych rejestrów:

- [44 darmowe generatory](docs/generator-directory.md) — UI i komponenty, diagramy, grafiki, SVG, patterny, tekstury, 3D, obrazy AI oraz wideo. Narzędzia open source są oddzielone od usług chmurowych z darmowym limitem.
- [37 repozytoriów GitHub do nauki](docs/github-learning-directory.md) — UI/UX, dostępność, design systems, efekty stron, WebGL/GLSL oraz parallax.
- [15 wzorcowych realizacji scrollytelling](docs/scrollytelling-inspiration-directory.md) — wyłącznie do analizy struktury, rytmu i interakcji; bez kopiowania kodu i assetów.
- [9 katalogów czcionek open source](docs/font-source-directory.md) — ze wskazaniem licencji, sposobu dostarczania i kontroli polskich znaków.
- [7 pakietów i narzędzi palet kolorów](docs/color-palette-package-directory.md) — gotowe skale, generatory kontrastowe, tokeny i biblioteki obliczeniowe CSS Color 4/5; wszystkie open source i instalowane wyłącznie na żądanie.

Rejestry maszynowe znajdują się w `catalog/generator-registry.json`, `catalog/learning-repository-registry.json`, `catalog/scrollytelling-inspiration-registry.json`, `catalog/font-source-registry.json` i `catalog/color-palette-registry.json`. Usługi freemium pozostają wyłącznie linkami; baza nie pobiera materiałów z płatnych planów.

## Start

```powershell
git clone --recurse-submodules https://github.com/wojciechmathea-hash/ui-motion-3d-knowledge-base.git
Set-Location ui-motion-3d-knowledge-base
pwsh ./tools/validate.ps1
pwsh ./tools/build-catalog.ps1
```

Jeśli repo zostało sklonowane bez submodułów:

```powershell
git submodule update --init --recursive --depth 1
```

## Szybki wybór technologii

| Potrzeba | Zacznij od |
|---|---|
| Animacje sekwencyjne, SVG, timeline, scroll | Anime.js |
| Shadery, WebGL, sceny 3D, generative art | ThreeUI Community |
| Komponenty marketingowe React + Tailwind | Magic UI |
| Efektowne tła, tekst i mikrointerakcje React | React Bits |
| Szerokie wyszukiwanie społecznościowe | 21st.dev, z obowiązkową kontrolą licencji |
| Darmowy template widoczny przy Magic UI Pro | Publiczny `magicuidesign/portfolio` na licencji MIT; cała warstwa Pro pozostaje wyłączona |
| Headless UI i dostępne prymitywy | Radix Primitives, Base UI, TanStack Table |
| Motywy i gotowe sekcje Tailwind | shadcn/ui, daisyUI, HyperUI, Kokonut UI |
| Proste animacje layoutu | AutoAnimate |
| Animacje React i gesty | Motion albo React Spring |
| React + Three.js | React Three Fiber + Drei; Leva do strojenia parametrów |
| Tabele i duże zbiory danych | TanStack Table, Glide Data Grid, Grid.js |
| Wykresy | Recharts, Apache ECharts, visx, Chart.js lub Tremor |
| Ikony | Tabler Icons, Lucide, Heroicons albo Phosphor Icons |
| HDRI i tekstury | Poly Haven CC0, ręcznie lub przez oficjalne API; modeli z biblioteki nie używamy |
| Generowanie modeli 3D | Blender/Sverchok, OpenSCAD, CadQuery, TripoSR, InstantMesh, Shap-E albo TRELLIS zgodnie z polityką i licencją checkpointu |
| Generator UI lub aplikacji | Lokalnie: Penpot, GrapesJS, Puck, Onlook; free tier: v0, Bolt albo Lovable |
| Generator grafik i patternów | css-doodle, Tabbied, Haikei lub BGJar; dla AI: lokalny ComfyUI/InvokeAI albo zweryfikowany free tier |
| Generator filmu | Manim lub Motion Canvas dla kodu; Wan2.1/LTX-Video lokalnie; Firefly, Pika i Runway tylko w aktualnym bezpłatnym limicie |
| Nauka WebGL i shaderów | WebGL Fundamentals, WebGL2 Fundamentals, Three.js Fundamentals, shader-school i WebGL2 Examples |
| Nauka parallax | Parallax.js, Rellax, simpleParallax.js i Atropos z obowiązkowym fallbackiem reduced-motion |
| Palety i tokeny kolorów | Radix Colors lub Primer Primitives; Leonardo i Material Color Utilities do generacji; Culori lub Color.js do własnych obliczeń i OKLCH |

Pełne drzewo decyzji znajduje się w [docs/selection-guide.md](docs/selection-guide.md).

## Projekty

- [ALLinTraders site](projects/allintraders-site/README.md) — oryginalny, responsywny landing page bez 3D, z interaktywnym Market Lab, eksploratorem programu, ostrzeżeniami o ryzyku i pełnym provenance.

## Jedna instrukcja tworzenia

Każda treść, strona, prezentacja, UI i komponent podlega jednej nadrzędnej instrukcji: [CREATION_STANDARD.md](CREATION_STANDARD.md). Finalne realizacje nie zawierają placeholderów, wykorzystują sensowną interaktywność i subtelny motion. Pomocniczy [standard budowania witryn](knowledge/web-building-rules.md), [praktyki palet kolorów](knowledge/color-palette-practices.md) i [checklista jakości](templates/web-quality-checklist.md) rozwijają jej wymagania dla webu.

Pomocnicza [specyfikacja modeli 3D](knowledge/three-d-model-policy.md) rozwija odpowiedni rozdział instrukcji: Polygen i generyczne biblioteki low-poly/voxel są wyłączone, a finalne modele mają powstawać w zatwierdzonych generatorach open source z pełnym provenance.

## Aktualizacja bazy

```powershell
pwsh ./tools/update-upstreams.ps1
pwsh ./tools/validate.ps1
git diff --submodule=log
```

Aktualizacja zmienia przypięte commity submodułów. Przed commitem należy przejrzeć różnice i ewentualne zmiany licencji.

## Zasada bezpieczeństwa IP

Do katalogu można dodać implementację tylko wtedy, gdy jej źródło i licencja są jednoznaczne. Gdy licencja jest nieznana, rekord pozostaje linkiem z decyzją `reference-only`. Materiały premium nie są automatycznie pobierane, nawet gdy repozytorium jest prywatne.
