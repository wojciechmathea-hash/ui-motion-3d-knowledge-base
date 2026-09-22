# Visual layer stack — Japan History

## Kontrakt sceny

| Pole | Wartość |
|---|---|
| Cel użytkownika | zrozumieć chronologię Japonii jako przejście przez kolejne epoki |
| Informacja, której wymaga głębia | ciągłość krajobrazu przy zmianie politycznego i kulturowego planu |
| Wybrany tryb | `webgl` + source-defined layered foreground 2.5D |
| Dlaczego prostszy tryb nie wystarcza | wymagany styl to źródłowa scena Kage, w której kamera, live frames i foreground tworzą przestrzenną ciągłość rozdziałów |
| Zatwierdzony wzorzec / komponent | ThreeUI `kage-landing-page` |
| Registry ID + upstream file | `threeui` — `upstream/threeui/public/landing-pages/kage.html` |
| Stabilna warstwa UI | `.page`, `#nav`, `#rail` w semantycznym DOM |
| Zakres aktywnego scrolla | źródłowy zakres całego dokumentu, mapowany na `data-cam=0…5` |
| Fallback statyczny | source-defined `.no-webgl`, cztery lokalne WebP i pełna treść DOM |
| Reduced motion | source-defined media query wyłącza transformacje i płynne przejścia |

## Mapa warstw

| ID | Rola głębi | Asset / pass | Registry ID i provenance | Technika | Z-order / Z | Okluzja i maska | Blur / kontrast | Mapowanie scrolla | Pointer / touch | Mobile | Reduced motion |
|---|---|---|---|---|---|---|---|---|---|---|---|
| `ui` | semantyczny interfejs | nav, hero, tekst, cards, lessons, footer | `threeui`, `provenance/threeui-kage.json` | DOM | 10–50 | UI zachowuje źródłowy stacking | brak blur na tekście | source reveal + aktywny rozdział | klawiatura, pointer, touch | źródłowy mobile layout | pełna treść statyczna |
| `foreground` | bliski plan | 10 WebP cut-outs | jw. | DOM/CSS 2.5D | `#fg-sky` 35 | źródłowe maski i stage ownership | source filters | `data-fg` + `data-fg-in` | `pointer-events:none` | źródłowy crop | statyczny kadr |
| `subject` | architektura | świątynia, torii, schody, latarnie | jw. | Three.js geometry | source scene Z | kamera i mgła | source lighting/bloom | `data-cam` | source pointer response | LOW mode | stabilna kamera |
| `midground` | ogród i otoczenie | drzewa, most, deszcz, liście, ripples | jw. | Three.js | source scene Z | source depth | source fog/materials | source chapter states | source pointer | ograniczone efekty | wyłączone pętle |
| `background` | daleki plan | niebo, księżyc, dolina | jw. | Three.js | najniższe render order | pełny kadr | source fog/halo | source camera parallax | source pointer | niższy DPR | statyczny |
| `post` | atmosfera | bright/composite render targets | jw. | WebGL post-processing | final pass | pełnoekranowy pass | source bloom/grain | jedna pętla renderera | brak osobnego hit targetu | LOW mode | ograniczony/wyłączony |

## Wspólny model ruchu

| Pole | Wartość |
|---|---|
| Jedno źródło postępu | natywny `scrollY`, źródłowy handler Kage |
| Zakres 0–1 | wewnętrznie mapowany na zakres każdego `data-cam` |
| Kierunek scroll down / up | odwracalne źródłowe przejścia kamery i foreground |
| Easing / damping | bez zmian względem Kage |
| Maksymalna amplituda | bez zmian względem Kage |
| Stan przed wejściem | warstwa poza kadrem / poprzednia kamera |
| Stan aktywny | jeden rozdział posiada foreground i live frame |
| Stan po wyjściu | warstwa przechodzi do następnego stanu bez pustego kadru |
| Zachowanie po przerwaniu | źródłowa interpolacja od aktualnego stanu |

## Budżet assetów i renderowania

| Warstwa | Wymiary źródłowe | Format | Transfer | Pamięć po dekodowaniu / GPU | Lazy/preload | Uwagi |
|---|---:|---|---:|---:|---|---|
| foreground 10 plików | do 1774×1499 | WebP alpha | ok. 1.90 MB łącznie | kontrolowana przez źródłowy staging | lazy | tylko aktywne plany dominują wizualnie |
| fallback scenes 4 pliki | source-defined | WebP | ok. 0.67 MB łącznie | tylko fallback/cards | CSS/background | lokalne, bez remote media |
| font bundle | source subsets | WOFF2 w CSS data URI | ok. 99 KB CSS | font cache | stylesheet | OFL-1.1 |
| Three.js runtime | r-source bundle | JS | ok. 594 KB | jedna instancja | blocking before scene | MIT |

| Budżet | Desktop | Mobile |
|---|---:|---:|
| DPR | source cap | source LOW-mode cap |
| Liczba aktywnych foreground layers | 2–4 na rozdział | 1–3 zależnie od breakpointu |
| Liczba canvasów | 1 | 1 |
| Draw calls | źródłowy budżet Kage | source LOW mode |
| Tekstury jednocześnie | źródłowy renderer | ograniczone przez LOW mode |
| Cel frame time / FPS | ≤16.7 ms / 60 FPS | ≤33.3 ms / 30 FPS |

## Test okluzji i krawędzi

- [x] UI i fokus pozostają widoczne w sprawdzonym zakresie ruchu.
- [x] Foreground nie zasłania komunikatu ani CTA w źródłowych stanach rozdziałów.
- [x] Żaden plan nie odsłania pustej krawędzi w sprawdzonych przejściach.
- [x] Cut-outs nie mają widocznej obwódki ani brudnej maski.
- [x] Blur/post-processing nie obejmuje tekstu DOM.
- [x] Zachowano niezmienione źródłowe breakpointy i reguły zoom/reflow.
- [x] Bez JavaScriptu pozostaje pełna treść DOM i lokalne fallbacki obrazowe.

## Dowody QA

| Test | Narzędzie / urządzenie | Wynik | Dowód |
|---|---|---|---|
| Scroll w przód i wstecz | Codex in-app browser | poprawny | odwracalne źródłowe przejścia i stabilne kotwice |
| Nawigacja rozdziałów | Codex in-app browser | poprawny | wszystkie kotwice przechodzą do właściwych scen |
| Klawiatura i accessibility tree | AX browser audit | poprawny | polskie nazwy nav, menu, rail i CTA |
| Reduced motion | inspekcja niezmienionego source CSS | zachowany | źródłowy media query pozostaje bez zmian |
| Szeroki desktop | 1910×1074 | poprawny | brak kolizji hero, gate, cards i atlasu epok |
| Mobile i tablet | niezmienione source breakpoints Kage | zachowane | brak lokalnych nadpisań responsive CSS |
| Konsola | browser dev logs | poprawny | 0 błędów i ostrzeżeń |
| Słabsze urządzenie | source LOW mode | zachowany | kod detekcji oraz redukcji renderera bez zmian |
