# Visual layer stack — Kosmos w skali

## Kontrakt sceny

| Pole | Wartość |
|---|---|
| Cel użytkownika | zrozumieć zmianę skali od Ziemi po odległe galaktyki |
| Informacja, której wymaga głębia | ciągłość pola gwiazd oraz relacja bliskich i odległych kadrów |
| Wybrany tryb | `webgl` + płaskie media w DOM |
| Dlaczego prostszy tryb nie wystarcza | źródłowy Galaxy wykorzystuje wielowarstwowy shader i ciągłą reakcję na wskaźnik, których statyczny obraz nie pokazuje |
| Zatwierdzony wzorzec / komponent źródłowy | ThreeUI Kage + React Bits Galaxy |
| Registry ID + upstream file | `threeui / kage.html`; `react-bits / Galaxy.jsx` |
| Stabilna warstwa UI | cały tekst, linki, rail, cards i stopka w DOM |
| Zakres aktywnego scrolla | cały dokument; shader pozostaje tłem, a scroll steruje wyłącznie stanami Kage |
| Fallback statyczny | lokalny obraz NASA Pillars of Creation |
| Reduced motion | `disableAnimation=true`, brak przesunięcia reveal, statyczne karty |

## Mapa warstw

| ID | Rola głębi | Asset / pass | Registry ID i provenance | Technika | Z-order / Z | Okluzja i maska | Blur / skala / kontrast | Mapowanie scrolla | Pointer / touch | Mobile | Reduced motion |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `ui` | semantyczny interfejs | Kage nav, tekst, cards, rail, footer | `threeui`, `threeui-kage-layout.json` | DOM | najwyżej | niezasłaniana | źródłowe scrimy Kage | source reveal/active section | klawiatura, pointer, touch | rail ukryty | pełna treść |
| `media` | subject | 4 obrazy NASA | `nasa-media`, `nasa-media.json` | `img` / CSS background | sloty treści | źródłowy clipping Kage | źródłowe cover/kontrast | wędruje z sekcją | brak wymogu | responsywne sloty | statyczne |
| `stars` | background | Galaxy fragment shader | `react-bits`, `react-bits-galaxy.json` | WebGL/OGL | fixed 0 | viewport clipping | źródłowe glow/saturation | niezależne od scrolla | źródłowa repulsja myszy | 1 canvas | czas zatrzymany |
| `fallback` | background | Pillars of Creation MIRI | `nasa-media`, `nasa-media.json` | CSS image | pod UI | viewport clipping | source slot cover | stabilny | brak | pełny kadr | pełny kadr |

## Wspólny model ruchu

| Pole | Wartość |
|---|---|
| Jedno źródło postępu | natywny `scrollY` i IntersectionObserver Kage |
| Zakres 0–1 | aktywna sekcja obliczana względem środka viewportu |
| Kierunek przy scroll down / up | w pełni odwracalny |
| Wspólne easing / damping | źródłowe `--ease-out` Kage; Galaxy lerp `0.05` |
| Maksymalna amplituda | reveal zgodny z Kage; Galaxy wyłącznie źródłowa repulsja |
| Stan przed wejściem | kolejny rozdział ma obniżoną ekspozycję, ale pozostaje w DOM |
| Stan aktywny | tekst i kadr osiągają pełny stan, rail aktualizuje pozycję |
| Stan po wyjściu | poprzednia sekcja pozostaje w dokumencie, tło zachowuje ciągłość |
| Zachowanie po przerwaniu | natychmiastowy stabilny stan wynikający z aktualnego viewportu |

## Budżet assetów i renderowania

| Warstwa | Wymiary źródłowe | Format | Transfer | Szacowana pamięć po dekodowaniu / GPU | Lazy/preload | Uwagi |
|---|---:|---|---:|---:|---|---|
| Earthrise | 1920×1200 | JPEG | ≤ 0.4 MB | ok. 8.8 MB | preload hero | oficjalny download NASA |
| Solar System | 1920×640 | JPEG | ≤ 0.5 MB | ok. 4.7 MB | lazy | oficjalny download NASA |
| Our Galaxy | 2000×2630 | PNG → lokalny WebP/JPEG bez zmiany treści | ≤ 1.0 MB | ok. 20 MB | lazy | zachowany kredyt |
| Pillars MIRI | 1987×1817 | PNG → lokalny WebP/JPEG bez zmiany treści | ≤ 1.0 MB | ok. 13.8 MB | lazy/fallback | zachowany kredyt |
| Galaxy | proceduralny | shader | bundle JS | pojedynczy target viewportu | start po DOM | brak tekstur |

| Budżet | Desktop | Mobile |
|---|---:|---:|
| DPR | źródłowy OGL renderer | źródłowy OGL renderer |
| Liczba aktywnych warstw | UI + 1 canvas + bieżące media | UI + 1 canvas + bieżące media |
| Liczba canvasów | 1 | 1 |
| Draw calls | 1 triangle pass | 1 triangle pass |
| Tekstury jednocześnie w pamięci | obrazy DOM według przeglądarki | obrazy DOM według przeglądarki |
| Cel frame time / FPS | ≤16.7 ms / 60 FPS | ≤33 ms / 30–60 FPS |

## Test okluzji i krawędzi

- [x] UI i fokus pozostają widoczne w całym zakresie ruchu.
- [x] Tło nie zasłania komunikatu ani CTA.
- [x] Obrazy nie odsłaniają pustych krawędzi.
- [x] Nie ma wycięć, jasnych obwódek ani podwójnych konturów.
- [x] Blur nie obejmuje tekstu ani interfejsu.
- [x] Relacje zachowują się przy zmianie viewportu; wąski viewport pokrywa przypadek reflow odpowiadający powiększeniu.
- [x] Bez JavaScriptu pozostają kompletna treść i stabilny kadr dzięki regułom `noscript` i lokalnemu fallbackowi CSS.

## Dowody QA

| Test | Narzędzie / urządzenie | Wynik | Dowód |
|---|---|---|---|
| Scroll w przód i wstecz | Codex IAB / Chromium | PASS | nawigacja hero → finał → hero; `scrollY` 0 → 4371 → 0; rail 0 → 4 → 0 |
| Mysz z kółkiem i trackpad | Codex IAB scroll API | PASS | sekcje aktualizują aktywny rail, reveal osiąga opacity 1 |
| Touch | mobilny viewport + menu | PASS | menu otwiera się, blokuje scroll, zamyka się i przywraca dokument |
| Reduced motion | review CSS + `galaxy-entry.jsx` | PASS | reveal natychmiastowy; Galaxy ma wyłączony czas i pointer |
| 390×844 | viewport rzeczywisty CSS | PASS | `scrollWidth 367 ≤ innerWidth 390`; H1 mieści się w 327.8 px; menu dostępne |
| 768×1024 | viewport rzeczywisty CSS | PASS | `scrollWidth 745 ≤ innerWidth 767`; canvas 1; menu dostępne |
| 1440×900 | viewport rzeczywisty CSS | PASS | `scrollWidth 1416 ≤ innerWidth 1438`; wszystkie linki nav w kadrze |
| Słabsze urządzenie / throttling | audyt architektury | PASS z ograniczeniem | 1 canvas, 1 pełnoekranowy triangle pass, brak tekstur w shaderze, 4 zoptymalizowane lokalne media |
