# Brief — Japonia: historia zapisana w krajobrazie

## Odbiorca i zadanie

Odbiorcą jest osoba, która chce w kilka minut zrozumieć główne przełomy historii Japonii bez czytania encyklopedycznej osi czasu. Główne zadanie: przejść od prehistorii Jōmon przez stolice Nara i Heian, rządy wojowników oraz restaurację Meiji do konstytucji z 1947 roku.

Główny komunikat: historia Japonii jest ciągiem zmian politycznych i kulturowych, w których kolejne formy państwa nakładały się na pamięć wcześniejszych epok.

Główna akcja: przewijać narrację i korzystać z nawigacji rozdziałów. Format: samodzielna, responsywna strona HTML uruchamiana lokalnie w przeglądarce.

## Storyboard

1. Teza — tysiące lat historii są widoczne w krajobrazie, stolicach i instytucjach.
2. Kontekst — Jōmon oraz formowanie wczesnego państwa.
3. Napięcie — przesunięcie władzy od dworu do rządów wojowników.
4. Dowód — Nara, Heian/Kyoto, Kamakura, Edo, Meiji i konstytucja z 1947 roku.
5. Konsekwencja — współczesna Japonia zachowuje materialne i instytucjonalne ślady kolejnych epok.
6. Działanie — ponowne przejście osi czasu lub otwarcie źródeł w stopce.

## Kontrakt jakości

Teza wizualna: nocny spacer przez kolejne warstwy czasu; krajobraz pozostaje ciągły, podczas gdy tekst i kamera zmieniają historyczny punkt odniesienia.

Zasady kierunku artystycznego:

1. Jedna nocna paleta ThreeUI Kage: grafit, kość słoniowa i cynober.
2. Jeden źródłowy układ pełnostronicowy oraz jedna źródłowa gramatyka ruchu.
3. Warstwy roślinności i architektury służą jako przejście między epokami, nie jako samodzielne ozdobniki.

Antycele:

1. Brak losowych brył, kart i gradientów spoza komponentu Kage.
2. Brak katalogowego przeglądu komponentów i efektów.
3. Brak fikcyjnych danych, placeholderów i niesprawdzonych dat.

## Wzorzec kompozycyjny

Pełny wzorzec `threeui / kage-landing-page`: stała nawigacja, hero z rozdziałami, cztery sceny narracyjne, interaktywne kadry, boczny navigator i stopka. Nie zmieniamy geometrii, tokenów, motion ani renderera; dopuszczona adaptacja obejmuje wyłącznie polską treść, etykiety osi czasu, tytuł dokumentu i działające odnośniki do źródeł.

## Gramatyka layoutu i ruchu

- Układ, breakpointy, typografia, powierzchnie, promienie, cienie i kolory: bez zmian względem `kage.html`.
- Ruch: źródłowe reveal `fade/up`, źródłowe przejścia kamery, source-defined foreground staging, interaktywne karty i rail navigation.
- Reduced motion: źródłowy wariant `prefers-reduced-motion`, bez dodawania własnego ruchu.
- Dominanta: hero — tytuł; rozdział I — geneza; rozdział II — trzy stolice; rozdział III — pięć epok; finał — przejście do nowoczesnego państwa.

## Treść i źródła faktów

- UNESCO, Jōmon Prehistoric Sites in Northern Japan: https://whc.unesco.org/en/list/1632
- UNESCO, Historic Monuments of Ancient Nara: https://whc.unesco.org/en/list/870
- UNESCO, Historic Monuments of Ancient Kyoto: https://whc.unesco.org/document/154031
- The Metropolitan Museum of Art, Kamakura and Nanbokuchō Periods: https://www.metmuseum.org/essays/kamakura-and-nanbokucho-periods-1185-1392
- National Diet Library, Modern Japan chronology: https://www.ndl.go.jp/modern/e/utility/chronology.html
- National Diet Library, Birth of the Constitution of Japan: https://www.ndl.go.jp/constitution/e/etc/history.html

Tekst jest autorskim, krótkim omówieniem faktów z powyższych źródeł; nie kopiuje ich opisów.

## Kryteria ukończenia

- Pełna treść działa bez WebGL i bez JavaScriptu.
- Wszystkie lokalne assety, fonty i runtime mają provenance oraz licencję.
- Brak elementów spoza `SOURCE_LOCK_MANIFEST.md`.
- Brak nachodzenia treści przy 390×844, 768×1024 i 1440×900.
- Nawigacja działa myszą, dotykiem i klawiaturą; reduced motion jest czytelny.
- Konsola nie zawiera błędów, a walidacja repozytorium przechodzi.
