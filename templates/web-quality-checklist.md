# Web quality gate

Status: checklista wykonawcza do `CREATION_STANDARD.md`, a nie osobna instrukcja.

Skopiuj checklistę do katalogu projektu jako `QUALITY.md` i wypełnij przed uznaniem strony za gotową.

## Cel i treść

- [ ] Odbiorca, główne zadanie i jedna najważniejsza akcja są zapisane.
- [ ] Kolejność treści jest zrozumiała bez animacji i JavaScriptu.
- [ ] Dane demonstracyjne są oznaczone, a twierdzenia mają źródła.
- [ ] Nie ma placeholderów, `Lorem ipsum`, `TODO`, `TBD`, pustych kart, atrap mediów, niedziałających `#`-linków ani nieaktywnych CTA.
- [ ] Jest jeden `h1`, logiczna hierarchia nagłówków i semantyczny landmark `main`.

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
