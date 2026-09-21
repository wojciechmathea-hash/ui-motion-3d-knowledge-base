# Web quality gate

Status: checklista wykonawcza do `CREATION_STANDARD.md`, a nie osobna instrukcja.

Skopiuj checklistę do katalogu projektu jako `QUALITY.md` i wypełnij przed uznaniem strony za gotową.

## Cel i treść

- [ ] Odbiorca, główne zadanie i jedna najważniejsza akcja są zapisane.
- [ ] Kolejność treści jest zrozumiała bez animacji i JavaScriptu.
- [ ] Dane demonstracyjne są oznaczone, a twierdzenia mają źródła.
- [ ] Jest jeden `h1`, logiczna hierarchia nagłówków i semantyczny landmark `main`.

## UI i responsywność

- [ ] Komponenty są zmapowane na wspólne tokeny koloru, typografii, odstępów i ruchu.
- [ ] Nie ma poziomego overflow przy 320, 390, 768, 1280 i 1440 CSS px.
- [ ] Treść działa przy zoomie 200% i nie jest przycinana przez sticky/fixed warstwy.
- [ ] Touch targety spełniają minimum 24×24 px; kluczowe kontrolki celują w 44×44 px.
- [ ] Hover nie jest jedyną drogą do informacji lub działania.

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

## Wydajność i technika

- [ ] Produkcyjny build i typecheck przechodzą.
- [ ] Brak błędów konsoli i błędów hydracji.
- [ ] LCP ≤ 2.5 s, INP ≤ 200 ms i CLS ≤ 0.1 w danych terenowych lub istnieje plan pomiaru.
- [ ] Media mają wymiary, lazy loading i odpowiedni format.
- [ ] Ciężkie zależności są uzasadnione; scroll handler nie wykonuje niepotrzebnych renderów.
- [ ] Strona zachowuje podstawową treść po awarii lub wyłączeniu warstwy ulepszającej.

## Pochodzenie

- [ ] Każdy adaptowany komponent ma URL, commit/wersję, licencję i opis zmian.
- [ ] Każdy asset ma autora, źródło, licencję i datę pozyskania.
- [ ] Nie ma elementów Pro/Premium ani materiałów o nieznanej licencji.
- [ ] Przejrzano `CREATION_STANDARD.md` i właściwe rejestry katalogu.
