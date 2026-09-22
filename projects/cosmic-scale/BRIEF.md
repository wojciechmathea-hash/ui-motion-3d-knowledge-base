# Brief — Kosmos w skali

## Cel i odbiorca

- Odbiorca: osoba ciekawa astronomii, która chce intuicyjnie zrozumieć zmianę skali od Ziemi do głębokiego Wszechświata.
- Główne zadanie: przejść przez cztery logiczne rozdziały i powiązać liczby z obrazami oraz położeniem człowieka w kosmosie.
- Główny komunikat: kosmos staje się czytelny dopiero wtedy, gdy każda kolejna skala wynika z poprzedniej.
- Główna akcja: natywne przewijanie przez rozdziały, z możliwością bezpośredniego skoku na bocznej osi.
- Format: samodzielna strona HTML z lokalnymi assetami i zbudowanym runtime; do uruchomienia bez Node.js.

## Storyboard

1. Teza — zaczynamy od jedynego znanego domu: Ziemi widzianej znad Księżyca.
2. Kontekst — Układ Słoneczny porządkuje osiem planet i mniejsze ciała wokół jednej gwiazdy.
3. Napięcie — Droga Mleczna rozszerza skalę do ponad 100 000 lat świetlnych.
4. Dowód — obrazy Webba odsłaniają odległe galaktyki i obszary narodzin gwiazd.
5. Konsekwencja — obserwacja kosmosu jest jednocześnie patrzeniem w przeszłość.
6. Działanie — odbiorca może przejść do oficjalnych materiałów źródłowych.

## Kontrakt jakości

### Teza wizualna

Stabilny, typograficzny dokument przesuwa się nad jednym ciągłym polem gwiazd; kolejne obrazy obserwacyjne pojawiają się wyłącznie jako dowody zmiany skali, a nie niezależne dekoracje.

### Trzy zasady

1. Jedna nocna paleta, siatka i rytm kompletnego układu ThreeUI Kage.
2. Jedno interaktywne tło React Bits Galaxy reagujące subtelnie na wskaźnik.
3. Wszystkie zdjęcia pełnią rolę dowodu i zachowują oficjalny opis oraz kredyt.

### Trzy antycele

1. Brak planet z przypadkowych brył, low-poly, gotowych modeli i Polygen.
2. Brak „kosmicznego” zestawu neonów, orbit, kart i efektów z wielu bibliotek.
3. Brak fikcyjnych danych, ozdobnych wykresów, placeholderów i nieaktywnych linków.

### Wzorzec kompozycyjny

Kompletny `threeui / kage-landing-page`: stała nawigacja, hero z czterema zapowiedziami, cztery rozdziały, moduł trzech kadrów, pięciowierszowy atlas skali, boczny navigator i stopka. Źródłowa scena sanktuarium oraz PNG pierwszego planu zostają pominięte; ich pojedynczy slot tła zajmuje kompletny komponent React Bits `Galaxy`.

### Gramatyka layoutu

- Siatka, szerokości, breakpointy, typografia, promienie, obramowania i hierarchia: bez zmian względem `kage.html`.
- Fotografie NASA zajmują wyłącznie istniejące źródłowe sloty `.peek` i `.card`.
- Interfejs pozostaje semantycznym DOM nad warstwą WebGL.

### Gramatyka ruchu

- React Bits Galaxy: źródłowa pętla shadera, twinkle i reakcja na pointer.
- ThreeUI Kage: źródłowe reveal, aktywny rozdział, rail i nawigacja kotwicowa.
- Reduced motion: shader renderuje stabilny kadr bez aktualizacji czasu, a reveal pokazuje treść bez przesunięcia.

## Mapa interakcji

| Komponent | Korzyść | Bez ruchu | Bez JavaScriptu |
|---|---|---|---|
| Galaxy | jedna ciągła mapa głębi i skali | statyczne pole gwiazd | lokalny obraz Pillars of Creation |
| Nawigacja Kage | bezpośredni dostęp do rozdziałów | działające kotwice | działające kotwice |
| Rail Kage | orientacja w postępie dokumentu | etykiety dostępne | nawigacja główna |
| Reveal Kage | prowadzenie uwagi między skalami | elementy stale widoczne | pełna treść |
| Cards Kage + obrazy NASA | porównanie trzech poziomów skali | pełne podpisy | pełne obrazy i podpisy |

## Ograniczenia

- `source-locked`: brak elementu bez rekordu źródłowego.
- Jedyny miks rodzin: Kage zapewnia kompletny layout i motion dokumentu, Galaxy wypełnia brakującą kosmiczną warstwę atmosferyczną.
- Media wyłącznie z oficjalnych stron NASA, bez logotypów i bez osób.
- Cel WCAG 2.2 AA; fokus, reduced motion, semantyczne nagłówki i prawdziwe linki.
- Jeden canvas, jeden draw call shadera, DPR kontrolowany przez źródłowy OGL.

## Kryteria ukończenia

- Brak placeholderów, pustych kotwic i zdalnie ładowanych mediów.
- Wszystkie fakty i zdjęcia mają źródło, kredyt oraz rekord provenance.
- Strona działa po bezpośrednim otwarciu `index.html`, bez Node.js.
- Scroll w obu kierunkach, rail, menu, pointer i reduced motion nie powodują skoków ani nakładania treści.
- Audyt 390×844, 768×1024 i 1440×900 oraz walidacja repozytorium zakończone powodzeniem.

