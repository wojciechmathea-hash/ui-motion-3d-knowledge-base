# Visual layer stack

Status: obowiązkowy dokument projektowy do sekcji 9 `CREATION_STANDARD.md`. Skopiuj go jako `VISUAL_LAYER_STACK.md`, zanim zaimplementujesz 2.5D, CSS 3D albo WebGL.

## Kontrakt sceny

| Pole | Wartość |
|---|---|
| Cel użytkownika | |
| Informacja, której wymaga głębia | |
| Wybrany tryb | `layered-2.5d` / `css-3d` / `canvas-2d` / `webgl` |
| Dlaczego prostszy tryb nie wystarcza | |
| Zatwierdzony wzorzec / komponent źródłowy | |
| Registry ID + upstream file | |
| Stabilna warstwa UI | |
| Zakres aktywnego scrolla | |
| Fallback statyczny | |
| Reduced motion | |

## Mapa warstw

Każdy wiersz musi mieć odpowiadający wpis w `SOURCE_LOCK_MANIFEST.md`. Kopia tego samego obrazu użyta do blur, maski lub refleksu jest osobną warstwą.

| ID | Rola głębi | Asset / pass | Registry ID i provenance | Technika | Z-order / Z | Okluzja i maska | Blur / skala / kontrast | Mapowanie scrolla | Pointer / touch | Mobile | Reduced motion |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `ui` | semantyczny interfejs | | | DOM | najwyżej | nie może być zasłonięta | brak blur | stabilna | klawiatura/touch | pełna | pełna |
| | foreground | | | | | | | | | | |
| | subject | | | | | | | | | | |
| | midground | | | | | | | | | | |
| | background | | | | | | | | | | |
| | atmosphere | | | | | | | | | | |

## Wspólny model ruchu

| Pole | Wartość |
|---|---|
| Jedno źródło postępu | |
| Zakres 0–1 | |
| Kierunek przy scroll down / up | |
| Wspólne easing / damping | |
| Maksymalna amplituda | |
| Stan przed wejściem | |
| Stan aktywny | |
| Stan po wyjściu | |
| Zachowanie po przerwaniu | |

## Budżet assetów i renderowania

| Warstwa | Wymiary źródłowe | Format | Transfer | Szacowana pamięć po dekodowaniu / GPU | Lazy/preload | Uwagi |
|---|---:|---|---:|---:|---|---|
| | | | | | | |

| Budżet | Desktop | Mobile |
|---|---:|---:|
| DPR | | |
| Liczba aktywnych warstw | | |
| Liczba canvasów | | |
| Draw calls | | |
| Tekstury jednocześnie w pamięci | | |
| Cel frame time / FPS | | |

## Test okluzji i krawędzi

- [ ] UI i fokus pozostają widoczne w całym zakresie ruchu.
- [ ] Foreground nie zasłania komunikatu ani CTA.
- [ ] Żaden plan nie odsłania pustej krawędzi po transformacji.
- [ ] Przezroczyste wycięcia nie mają jasnej obwódki, brudnej maski ani podwójnego konturu.
- [ ] Blur jest przypisany do pojedynczej warstwy, nie do tekstu ani całego kontenera 3D.
- [ ] Scena zachowuje relacje przy zmianie proporcji viewportu i zoomie 200%.
- [ ] Po wyłączeniu JavaScriptu pozostaje kompletny, stabilny kadr i dostępna treść.

## Dowody QA

| Test | Narzędzie / urządzenie | Wynik | Dowód |
|---|---|---|---|
| Scroll w przód i wstecz | | | |
| Mysz z kółkiem i trackpad | | | |
| Touch | | | |
| Reduced motion | | | |
| 390×844 | | | |
| 768×1024 | | | |
| 1440×900 | | | |
| Słabsze urządzenie / throttling | | | |
