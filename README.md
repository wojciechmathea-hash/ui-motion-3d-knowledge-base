# UI Motion 3D Knowledge Base

Prywatna, agent-friendly baza wiedzy do projektowania i budowania interfejsów: komponenty UI, animacje, mikrointerakcje, shadery, WebGL i sceny 3D.

Repozytorium porządkuje wskazane źródła, zachowuje ich pochodzenie i licencje oraz podpina otwarte implementacje jako submoduły Git. Nie jest kopią serwisów ani marketplace’em.

## Co znajduje się w repozytorium

| Obszar | Zawartość |
|---|---|
| `catalog/` | Rejestr źródeł, zasady użycia i automatycznie generowane podsumowanie zasobów |
| `docs/` | Taksonomia, przewodnik wyboru, licencje i workflow pracy |
| `knowledge/` | Reguły kompozycji UI, motion i 3D/WebGL |
| `templates/` | Szablon rekordu komponentu z pełnym provenance |
| `tools/` | Aktualizacja submodułów, generowanie indeksu i walidacja |
| `upstream/` | Przypięte wersje otwartych repozytoriów źródłowych |
| `AGENTS.md` | Instrukcje dla agentów AI korzystających z bazy |

## Źródła

- [ThreeUI](https://threeui.com/browse) — Community: komponenty 3D, WebGL i shadery; pełne otwarte źródło jako submoduł.
- [Anime.js](https://animejs.com) — silnik animacji oraz przykłady CSS, SVG, DOM, Canvas i Three.js.
- [Magic UI Pro](https://pro.magicui.design) — wyłącznie indeks funkcji i odnośniki; płatny kod i assety nie są kopiowane.
- [magicui.net](https://magicui.net) — źródło discovery kierujące do oficjalnego, bezpłatnego [Magic UI](https://magicui.design); otwarte repo Magic UI jest submodułem.
- [21st.dev](https://21st.dev) — używany przez oficjalne narzędzie i linki; marketplace nie jest scrapowany, a licencja jest sprawdzana osobno dla każdego komponentu.
- [React Bits](https://reactbits.dev) — indeks i przypięty upstream; kod wolno wykorzystywać w produktach, ale nie redystrybuować jako bibliotekę komponentów.

Szczegółowy stan prawny i techniczny jest opisany w [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md) oraz [docs/licensing.md](docs/licensing.md).

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
| Gotowe sekcje lub szablony premium | Magic UI Pro, tylko z własnym uprawnionym dostępem i bez kopiowania do tej bazy |

Pełne drzewo decyzji znajduje się w [docs/selection-guide.md](docs/selection-guide.md).

## Aktualizacja bazy

```powershell
pwsh ./tools/update-upstreams.ps1
pwsh ./tools/validate.ps1
git diff --submodule=log
```

Aktualizacja zmienia przypięte commity submodułów. Przed commitem należy przejrzeć różnice i ewentualne zmiany licencji.

## Zasada bezpieczeństwa IP

Do katalogu można dodać implementację tylko wtedy, gdy jej źródło i licencja są jednoznaczne. Gdy licencja jest nieznana, rekord pozostaje linkiem z decyzją `reference-only`. Materiały premium nie są automatycznie pobierane, nawet gdy repozytorium jest prywatne.
