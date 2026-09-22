# Warstwy wizualne, 2.5D i głębia na stronach

Status: materiał pomocniczy do sekcji 9 `CREATION_STANDARD.md`; nie stanowi osobnej instrukcji. Reguły powstały na podstawie dyskusji praktyków udokumentowanych w `docs/3d-layering-forum-research.md` i zostały technicznie sprawdzone względem specyfikacji przeglądarek.

## 1. Cztery poziomy głębi

| Poziom | Technika | Kiedy wystarcza | Czego nie dodaje |
|---|---|---|---|
| kompozycja optyczna | jeden finalny obraz, kadr, światło, cień i ostrość | głębia nie musi reagować na użytkownika | ruchu względnego |
| warstwowe 2.5D | osobne obrazy DOM/CSS poruszane z różnymi współczynnikami | hero, editorial, product storytelling, papierowy teatr | prawdziwej geometrii i kamery |
| CSS 3D | `perspective`, `translateZ`, `rotateX/Y`, `preserve-3d` | karty, galerie i małe zestawy elementów DOM | materiałów, shaderów i pełnej sceny |
| WebGL | jedna scena, kamera, tekstury, geometria, shadery | manipulacja produktem, mapa głębi, post-processing, wiele elementów | semantycznego UI |

Zaczynaj od najprostszego poziomu. Przejście wyżej wymaga zapisania, jaką informację lub interakcję wnosi cięższa technika.

## 2. Model kompozycji warstwowej

Warstwy nie są przypadkowymi dekoracjami. Każda pełni odrębną funkcję:

1. **Atmosphere** — kolor, światło, mgła, ziarno albo najdalszy plan. Ma najmniejszy ruch i nie niesie informacji.
2. **Background** — otoczenie i skala sceny. Porusza się wolniej niż temat.
3. **Midground** — elementy budujące relację przestrzenną z tematem.
4. **Subject** — główny obiekt lub grafika; jest optycznym punktem odniesienia.
5. **Foreground / occluder** — kontrolowane zasłonięcie krawędzi kadru; może poruszać się mocniej, ale nie może blokować treści.
6. **UI** — semantyczny HTML, tekst i kontrolki. Pozostaje czytelny, stabilny oraz niezależny od renderera.

Nie każda scena potrzebuje sześciu warstw. Minimalny poprawny układ to tło, temat i UI. Kolejny plan dodawaj tylko wtedy, gdy poprawia skalę, separację lub narrację.

## 3. Wzorzec „ostry front + rozmyte tło”

Przykład użytkownika należy traktować jako układ 2.5D, a nie automatyczny efekt:

- warstwa `subject` zawiera ostrą grafikę pierwszoplanową;
- warstwa `background` może użyć drugiej grafiki albo zatwierdzonej kopii tego samego assetu, powiększonej i inaczej skadrowanej;
- blur należy do tła, nie do wspólnego rodzica i nie do tekstu;
- tło porusza się wolniej, temat pozostaje stabilny albo reaguje słabiej, a opcjonalny foreground może poruszać się nieco szybciej;
- różnica nie może opierać się jednocześnie na maksymalnym blur, dużym scale, wysokim kontraście i mocnym parallaxie;
- obie grafiki muszą mieć zgodną perspektywę, światło, temperaturę koloru i kierunek kadru;
- rozmyta kopia nie może ujawniać powtórzonej twarzy, produktu, typografii ani krawędzi tworzącej widoczny „duch”.

Jeżeli tło jest statyczne, rozważ przygotowanie jego rozmytej wersji podczas generowania assetu zamiast ciągłego `filter: blur()` w przeglądarce. Oba pliki wymagają provenance.

## 4. Język głębi

Wybierz dwa lub trzy wspierające się sygnały, nie wszystkie naraz:

- **okluzja** — bliższa warstwa zasłania fragment dalszej;
- **ruch względny** — plan bliższy przemieszcza się mocniej niż dalszy;
- **ostrość** — temat ostry, wybrane plany rozproszone;
- **kontrast i nasycenie** — dalsze plany zwykle spokojniejsze;
- **skala i perspektywa** — bliższy element zajmuje większą część kadru;
- **światło i cień** — wspólne źródło światła oraz cień zgodny z relacją warstw;
- **mgła / depth fade** — stosowane głównie w WebGL, jeśli wynika z zatwierdzonego komponentu.

Jeżeli jeden sygnał mówi „blisko”, a pozostałe „daleko”, scena wygląda jak przypadkowy kolaż. Zapisz logikę w `VISUAL_LAYER_STACK.md` przed implementacją.

## 5. Ruch scroll i pointer

- Jeden kontroler wylicza postęp sceny `0–1`; każda warstwa mapuje ten sam postęp na własny, zapisany zakres.
- Ruch musi działać w obie strony i kończyć się stabilnym kadrem. Progi powodujące nagłe przeskoki są niedozwolone.
- Nie modyfikuj natywnej prędkości scrolla. Testuj kółko myszy, trackpad i touch, ponieważ wejścia mają różną rozdzielczość zdarzeń.
- Nie animuj elementu, który jednocześnie wyznacza trigger lub wysokość sceny, jeżeli zmiana geometrii przelicza własny zakres scrolla.
- Najpierw sprawdź scenę bez biblioteki motion, potem z ruchem pojedynczej warstwy, a dopiero później z pełnym stackiem.
- Pointer tracking jest uzupełnieniem, nie jedyną drogą do efektu. Na touch użyj spokojnego scroll mappingu albo statycznego kadru.
- Tekst, formularze i CTA nie uczestniczą w dużym ruchu głębi. Jeśli UI ma mikroparallax, musi zachować stabilny hit area i fokus.

## 6. Kadrowanie i okluzja

- Kontener sceny ma jawny aspect ratio i strategię `cover`/`contain` dla każdego breakpointu.
- Warstwy ruchome potrzebują bezpiecznego marginesu obrazu wynikającego z maksymalnej transformacji; nie rozwiązuj tego nieograniczonym scale.
- Maskę lub `overflow: clip` stosuj na właściwej ramie, nie na przodku, który ma utrzymać kontekst 3D.
- Foreground nie może przechodzić nad kontrolkami. Dekoracyjne plany używają `pointer-events: none` i są ukryte przed accessibility tree.
- Gdy warstwa jest interaktywna, jej hit area wynika z semantycznego elementu DOM lub jawnie odwzorowanej kontroli, nie z przypadkowego obszaru przezroczystej tekstury.

## 7. Assety i jakość wycięć

- Każdy plan ma finalny asset; placeholderowe prostokąty i prowizoryczne wycięcia nie przechodzą QA.
- Dla przezroczystych obrazów sprawdź fringe na jasnym i ciemnym tle, premultiplication alpha, brudne piksele oraz miękkość maski.
- Używaj wariantów responsywnych. Pikselowy wymiar pliku ma odpowiadać maksymalnemu rozmiarowi renderowania i DPR, zamiast polegać na metadanych DPI.
- Duże pliki przezroczyste mogą być droższe niż nieprzezroczyste tło. Mierz transfer, dekodowanie i pamięć po rozpakowaniu.
- W WebGL zestawy dużych warstw testuj z KTX2 i preloadem; pierwsze wejście warstwy nie może powodować uploadu blokującego widoczną klatkę.

## 8. CSS 3D i filtry

- `perspective` należy do wspólnej sceny, a elementy wymagające wspólnego Z uczestniczą w jednym kontrolowanym kontekście 3D.
- `filter`, opacity, maskowanie i część ustawień overflow mogą zgrupować potomków i spłaszczyć `preserve-3d`. Blur stosuj na konkretnym planie lub pre-renderowanym assetcie.
- `will-change` jest krótkotrwałą wskazówką dla niewielkiej liczby aktywnych elementów. Nie ustawiaj go globalnie i usuń po zakończeniu zmiany.
- Animuj przede wszystkim `transform` i `opacity`; animowany blur lub duży drop-shadow wymaga pomiaru paint/composite.

## 9. WebGL jako warstwa strony

- Używaj jednego canvasu i jednej kamery dla powiązanej sceny, a DOM układaj nad lub pod nim zgodnie z manifestem.
- Ogranicz DPR i pełnoekranowy overdraw; kilka półprzezroczystych planów może być kosztowniejsze niż prosta geometria.
- Pauzuj pętlę poza viewportem i w ukrytej karcie. Po demontażu zwolnij renderer, geometrie, materiały, tekstury i render targets.
- Nie łącz w jednym momencie ciężkiego wideo, pełnoekranowego post-processingu i wielu scroll animations bez profilu na słabym urządzeniu.
- Progressive enhancement: dokument i główne działanie są gotowe przed sceną, a fallback ma te same proporcje, aby nie powodować CLS.

## 10. Zatwierdzone punkty startowe w repozytorium

Te pozycje mogą być użyte dopiero po wskazaniu dokładnego pliku, licencji i dozwolonej adaptacji w manifeście:

- `threeui` → `kage-landing-page`: pełna scena z warstwowymi planami WebP, DOM/CSS i WebGL;
- `animejs` → `examples/layered-css-transforms`: przykład koordynacji transformacji warstw, nie gotowy layout strony;
- `react-bits` → `DepthCarousel`, `DepthText`, `TiltedCard`, `ScrollStack`: zamknięte komponenty z perspektywą i głębią, z ograniczeniami licencji React Bits;
- `magicui-net` → `ProgressiveBlur`, `BlurFade`, `ScrollProgress`: pomocnicze efekty, nie samodzielny system głębi;
- repozytoria `parallaxjs`, `rellax`, `simpleparallax` i `atropos` w rejestrze edukacyjnym służą do nauki; sam wpis edukacyjny nie zezwala na użycie elementu w projekcie.

## 11. Kryteria odrzucenia

Odrzuć scenę, gdy:

- głębia działa wyłącznie dzięki mocnemu blur albo przypadkowemu scale;
- warstwy poruszają się bez wspólnej osi i stabilnego punktu odniesienia;
- efekt odsłania puste krawędzie, podwójne kontury lub brudne maski;
- tekst drży, rozmywa się, traci kontrast albo przechodzi pod foreground;
- scroll jest przechwytywany lub scena jest zbyt długa względem przekazywanej informacji;
- mobile otrzymuje pomniejszoną wersję desktopu zamiast własnego kadru;
- po wyłączeniu motion/WebGL znika treść, CTA albo znaczenie sceny;
- efekt robi wrażenie przez kilka sekund, ale utrudnia dalsze korzystanie ze strony.

## 12. Źródła techniczne do weryfikacji implementacji

- [CSS Transforms Module Level 2](https://www.w3.org/TR/css-transforms-2/) — perspektywa, kontekst 3D i właściwości spłaszczające;
- [Scroll-driven Animations](https://www.w3.org/TR/scroll-animations-1/) — scroll/view progress timelines;
- [Filter Effects Module Level 1](https://www.w3.org/TR/filter-effects-1/) — kolejność filtrów i tworzenie stacking context;
- [CSS Will Change Module Level 1](https://www.w3.org/TR/css-will-change/) — ograniczone stosowanie `will-change`;
- [WCAG 2.2: Pause, Stop, Hide](https://www.w3.org/WAI/WCAG22/Understanding/pause-stop-hide) — kontrola ruchu automatycznego;
- [Three.js renderer docs](https://threejs.org/docs/pages/WebGLRenderer.html) — DPR, animation loop i cleanup renderera.
