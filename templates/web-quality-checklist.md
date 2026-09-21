# Web quality gate

Status: checklista wykonawcza do `CREATION_STANDARD.md`, a nie osobna instrukcja.

Skopiuj checklistę do katalogu projektu jako `QUALITY.md` i wypełnij przed uznaniem strony za gotową.

## Cel i treść

- [ ] Odbiorca, główne zadanie i jedna najważniejsza akcja są zapisane.
- [ ] Kolejność treści jest zrozumiała bez animacji i JavaScriptu.
- [ ] Dane demonstracyjne są oznaczone, a twierdzenia mają źródła.
- [ ] Nie ma placeholderów, `Lorem ipsum`, `TODO`, `TBD`, pustych kart, atrap mediów, niedziałających `#`-linków ani nieaktywnych CTA.
- [ ] Jest jeden `h1`, logiczna hierarchia nagłówków i semantyczny landmark `main`.

## Kierunek artystyczny i spójność

- [ ] `BRIEF.md` zawiera jedną konkretną tezę wizualną, trzy zasady i trzy antycele; nie opiera kierunku wyłącznie na słowach „premium”, „nowocześnie” lub „high-end”.
- [ ] Wskazano jeden zarejestrowany wzorzec kompozycyjny lub rodzinę layoutów dla całej realizacji.
- [ ] Zapisano jedną gramatykę layoutu: siatkę, szerokości, odstępy, typografię, powierzchnie, promienie, cienie i media.
- [ ] Zapisano jedną gramatykę ruchu: powtarzalne wejścia, wyjścia, feedback i wariant reduced motion.
- [ ] Każda sekcja realizuje etap narracji lub zadanie użytkownika; żadna nie istnieje tylko po to, by pokazać komponent albo efekt.
- [ ] Strona wygląda jak jeden produkt, nie jak galeria biblioteki, dokumentacja komponentów lub techniczne demo.
- [ ] Sąsiadujące sekcje zachowują ciągłość siatki, rytmu, typografii i języka motion.
- [ ] Karty i obramowane powierzchnie mają funkcjonalne uzasadnienie; całość nie tworzy „zupy kart”.
- [ ] Tło, gradient, shader, kursor i dekoracje pozostają słabsze od głównego komunikatu oraz działania.

## UI i responsywność

- [ ] Komponenty są zmapowane na wspólne tokeny koloru, typografii, odstępów i ruchu.
- [ ] Kolory są zmapowane na role semantyczne, a finalne pary tekst/tło, akcja/on-action, fokus i statusy mają sprawdzony kontrast.
- [ ] Nie ma poziomego overflow przy 320, 390, 768, 1280 i 1440 CSS px.
- [ ] Treść działa przy zoomie 200% i nie jest przycinana przez sticky/fixed warstwy.
- [ ] Touch targety spełniają minimum 24×24 px; kluczowe kontrolki celują w 44×44 px.
- [ ] Hover nie jest jedyną drogą do informacji lub działania.
- [ ] Każdy sensownie interaktywny obszar oferuje wybór, ujawnienie, porównanie lub feedback zamiast pozostawać statyczną atrapą.
- [ ] Nawigacja pokazuje kontekst lub aktywny stan, a stopka zawiera wyłącznie prawdziwe linki, kontakt i potrzebne informacje.
- [ ] Hero ma uzasadniony element angażujący (interakcję, demo, wizualizację lub finalne wideo) albo brief świadomie wskazuje wariant statyczny.
- [ ] Wideo ma poster, pauzę/sterowanie, napisy dla mowy, `muted` przy autoplay i wariant dla reduced motion oraz wolnej sieci.
- [ ] Interakcje nie dublują funkcji i nie tworzą natłoku poznawczego; całość pozostaje schludna oraz profesjonalna.

## Dostępność

- [ ] Kontrast tekstu i elementów UI spełnia WCAG 2.2 AA.
- [ ] Cała strona działa klawiaturą, kolejność fokusu jest logiczna, a fokus widoczny.
- [ ] Jest skip link, poprawny `lang`, tytuł dokumentu i dostępne nazwy kontrolek.
- [ ] Obrazy informacyjne mają `alt`; dekoracje są ukryte przed technologiami asystującymi.
- [ ] Reduced motion usuwa duże przemieszczenia, parallax, pętle i smooth scroll.
- [ ] Forced colors / high contrast nie ukrywa treści ani stanu aktywnego.

## Motion i scrollytelling

- [ ] Natywny scroll nie jest przechwytywany.
- [ ] Każdy rozdział jest samodzielnie czytelny.
- [ ] Sticky visual jest ulepszeniem, nie jedynym nośnikiem znaczenia.
- [ ] Na telefonie istnieje uproszczony pionowy układ.
- [ ] Każda animacja ma cel i stabilny stan końcowy.
- [ ] Animacje są subtelne, krótkie i reagują przede wszystkim na działanie użytkownika; dekoracyjne pętle mają uzasadnienie albo zostały usunięte.
- [ ] Każda kluczowa scena ma zaprojektowany stan przed wejściem, aktywny i po wyjściu oraz poprawnie działa przy przewijaniu wstecz.
- [ ] Ograniczona liczba archetypów przejść tworzy jeden język ruchu; efekty nie są losowo mieszane.
- [ ] Elementy nie znikają i nie pojawiają się nagle, jeżeli zmiana wymaga ciągłości przestrzennej lub narracyjnej.
- [ ] Sticky/pinned scena ujawnia relację lub zmianę, a nie tylko zamienia slajdy generycznym fade.

## Audyt wizualny

- [ ] Statyczny pierwszy viewport i reprezentatywny moduł zostały ocenione i poprawione przed dodaniem motion.
- [ ] Wykonano zrzuty lub równoważną inspekcję na 390×844, 768×1024 i 1440×900 CSS px.
- [ ] Sprawdzono początek, środek, koniec oraz co najmniej jeden aktywny stan każdej kluczowej sekcji.
- [ ] Nie ma kolizji, przycięć, pustych klatek przejściowych, skoków layoutu ani dopasowania przez `zoom` lub arbitralne `scale()`.
- [ ] Nazwano trzy najbardziej widoczne słabości wizualne i poprawiono je przed ukończeniem.
- [ ] Rezultat nie spełnia żadnego warunku natychmiastowego odrzucenia z sekcji 14A `CREATION_STANDARD.md`.

## Wydajność i technika

- [ ] Produkcyjny build i typecheck przechodzą.
- [ ] Brak błędów konsoli i błędów hydracji.
- [ ] LCP ≤ 2.5 s, INP ≤ 200 ms i CLS ≤ 0.1 w danych terenowych lub istnieje plan pomiaru.
- [ ] Media mają wymiary, lazy loading i odpowiedni format.
- [ ] Ciężkie zależności są uzasadnione; scroll handler nie wykonuje niepotrzebnych renderów.
- [ ] Dopracowanie high-end jest widoczne w stanach, spójności, płynności i braku błędów, a nie w liczbie bibliotek lub efektów.
- [ ] Strona zachowuje podstawową treść po awarii lub wyłączeniu warstwy ulepszającej.

## Pochodzenie

- [ ] Projekt zawiera `SOURCE_LOCK_MANIFEST.md` utworzony przed implementacją.
- [ ] Manifest obejmuje 100% widocznych i interaktywnych elementów: układy sekcji, komponenty, typografię, ikony, media, wizualizacje, ruch, tła i dekoracje.
- [ ] Każdy wpis wskazuje `registryId`, dokładny plik lub komponent upstream, URL, commit/wersję, licencję, dozwolone modyfikacje i rekord provenance.
- [ ] Nie ma wpisów `local-original`, elementów `reference-only` ani autorskich kształtów, układów, efektów lub wizualnych fallbacków agenta.
- [ ] Zastosowano jedną główną rodzinę komponentów; każde odstępstwo ma w manifeście uzasadnienie funkcjonalne i zgodność tokenów.
- [ ] Każdy adaptowany komponent ma URL, commit/wersję, licencję i opis zmian.
- [ ] Każdy asset ma autora, źródło, licencję i datę pozyskania.
- [ ] Nie ma elementów Pro/Premium ani materiałów o nieznanej licencji.
- [ ] Przejrzano `CREATION_STANDARD.md` i właściwe rejestry katalogu.
