# Jedyna instrukcja tworzenia

Ten dokument jest **jedyną nadrzędną instrukcją** dla tworzenia z użyciem tego repozytorium: treści, stron, prezentacji, interfejsów, komponentów, animacji, wizualizacji i doświadczeń 3D. Pozostałe pliki są katalogami, danymi, checklistami lub materiałem referencyjnym. Jeżeli wystąpi sprzeczność, obowiązuje ten dokument oraz bezpośrednie wymagania użytkownika.

## 1. Zasada nadrzędna

Kolejność decyzji jest stała:

> cel użytkownika → treść → struktura → dostępność → komponenty → układ → ruch → dekoracja

Nie zaczynaj od efektu, biblioteki ani wyglądu dema. Najpierw ustal, co odbiorca ma zrozumieć lub zrobić. Każdy element wizualny musi wspierać ten cel.

## 2. Dopuszczalne pochodzenie

Komponent, efekt, font, ikona, ilustracja, model, tekstura, szablon lub inny asset można wykorzystać tylko wtedy, gdy pochodzi z jednej z dwóch ścieżek:

1. **zatwierdzone źródło** — wpis w `catalog/source-registry.json` lub `catalog/font-source-registry.json`, z licencją pozwalającą na dane użycie;
2. **lokalne narzędzie open source** — wynik wygenerowany lub zbudowany za pomocą pozycji `local-open-source` z `catalog/generator-registry.json`, po sprawdzeniu licencji narzędzia, modelu, checkpointu, rozszerzeń i danych wejściowych.

Zwykły semantyczny HTML, CSS, TypeScript i kod integracyjny specyficzny dla projektu można pisać lokalnie. Nie wolno jednak przedstawiać nieudokumentowanego, ręcznie skopiowanego lub wygenerowanego przez zamkniętą usługę elementu jako komponentu z tej bazy.

Niedozwolone są:

- komponenty, assety i szablony Pro lub premium;
- kod, screenshoty, opisy, filmy i assety skopiowane z witryn inspiracyjnych;
- materiały o nieznanej licencji lub bez możliwego do wskazania autora i URL;
- rezultaty generatorów SaaS jako źródło finalnych komponentów lub assetów, chyba że użytkownik jawnie zmieni tę zasadę;
- scraping marketplace’ów i kopiowanie identyfikacji wizualnej cudzej marki;
- Polygen oraz przypadkowe biblioteki gotowych brył low-poly/voxel jako źródło finalnych modeli 3D.

`catalog/scrollytelling-inspiration-registry.json` jest wyłącznie rejestrem **do analizy**. Żadna pozycja z tego rejestru nie staje się przez to źródłem kodu, tekstów ani assetów.

## 3. Brief obowiązkowy

Przed tworzeniem zapisz krótko:

- odbiorcę i jego główne zadanie;
- jeden główny komunikat i jedną główną akcję;
- format rezultatu i kontekst użycia;
- hierarchię treści lub rozdziały narracji;
- ograniczenia techniczne, licencyjne, dostępnościowe i wydajnościowe;
- kryteria ukończenia i sposób weryfikacji.

Jeżeli informacji brakuje, przygotuj neutralny prototyp treściowy. Nie maskuj braków przypadkowymi efektami.

## 4. Treść i narracja

- Pisz od wniosku do uzasadnienia. Jeden akapit powinien realizować jedną myśl.
- Używaj konkretnych nagłówków, czasowników i etykiet opisujących rezultat działania.
- Nie twórz fikcyjnych danych wyglądających jak fakty. Dane demonstracyjne oznacz wprost.
- Dla historii wizualnej zbuduj storyboard: teza, kontekst, napięcie, dowód, konsekwencja, działanie.
- Każda scena musi być zrozumiała także jako statyczna treść. Animacja ujawnia relację, lecz nie zastępuje informacji.
- Cytaty, dane i media zapisują autora, źródło, datę oraz warunki użycia.

## 5. Typografia

- Font wybieraj wyłącznie z `catalog/font-source-registry.json`; sprawdź licencję konkretnej rodziny, a nie tylko katalogu.
- Sprawdź polskie znaki, kursywę, cyfry, potrzebne wagi i czytelność w rozmiarze tekstu podstawowego.
- Domyślnie używaj jednej rodziny; dwie tylko wtedy, gdy pełnią różne role. Nie przekraczaj trzech osi zmiennych i kilku rzeczywiście używanych wag.
- Tekst podstawowy zaczyna się zwykle od 16 px, `line-height` 1.5–1.75, a długość wiersza od około 45 do 75 znaków.
- Ładuj WOFF2, potrzebne subsety i preloading tylko dla fontu krytycznego. Zdefiniuj rozsądny fallback i kontroluj przesunięcia układu.
- Zachowuj plik licencji fontu oraz wpis provenance. Modyfikacje fontu wymagają ponownego sprawdzenia OFL i Reserved Font Names.

## 6. Kompozycja wizualna

- Jeden dominujący komunikat i jeden dominujący akcent na viewport lub slajd.
- Najpierw ustal siatkę, rytm odstępów, skalę typografii i szerokości treści; efekty dodawaj na końcu.
- Używaj wspólnych tokenów koloru, odstępów, promieni, cieni, typografii i czasu animacji.
- Obraz musi mieć funkcję: wyjaśniać, porównywać, budować kontekst lub kierować uwagę. Dekoracja nie może konkurować z treścią.
- Nie łącz wielu dominant: intensywnego tła, wielkiego tekstu, kursora, szkła, neonu, parallaxu i animacji ciągłej w jednej scenie.
- Kolor nie jest jedynym nośnikiem znaczenia. Wykresy mają etykiety, jednostki, źródło i tekstowy wniosek.
- Dla ilustracji i zdjęć utrzymuj jeden kierunek artystyczny, spójny kadr, temperaturę koloru i poziom szczegółu.

## 7. Strony, UI i komponenty

- Używaj semantycznego HTML i natywnych kontrolek przed ARIA.
- Komponent rozwiązuje konkretną potrzebę: nawigację, wybór, ujawnienie, feedback lub porównanie.
- Każdy komponent obejmuje stany: default, hover, focus, active, disabled, loading, empty, error oraz reduced motion, gdy ma ruch.
- Komponent ze źródła jest punktem wyjścia; jego demo-style nie przechodzi automatycznie do projektu. Przemapuj go na tokeny i hierarchię projektu.
- Wybieraj najmniejszą liczbę bibliotek. Nie buduj strony jako katalogu niepowiązanych efektów.
- Projektuj mobile-first i testuj przynajmniej szerokości 320/390, 768, 1280 i 1440 CSS px oraz zoom 200%.
- Podstawowa akcja nie może zależeć wyłącznie od hover, drag, WebGL ani animacji.

## 8. Motion i scrollytelling

- Scroll użytkownika pozostaje natywny. Nie przechwytuj go, nie spowalniaj i nie ukrywaj paska przewijania.
- Najpierw przygotuj czytelny dokument; sticky, parallax i przejścia są warstwą ulepszającą.
- Jedna scena sticky ma jeden cel i stabilne stany wynikające z aktywnego rozdziału.
- Animuj głównie `transform` i `opacity`; ogranicz pracę wykonywaną w zdarzeniu scroll.
- Każdy ruch musi komunikować zmianę stanu, hierarchię, kierunek lub relację. Ruch wyłącznie dekoracyjny usuń.
- `prefers-reduced-motion: reduce` usuwa parallax, scramble, duże przesunięcia, automatyczne pętle i smooth scroll.
- Na telefonie upraszczaj scrollytelling do pionowej narracji z czytelnymi stanami statycznymi.
- Inspiracje analizuj przez: strukturę, rytm, rolę mediów, progresję informacji, zachowanie mobile, dostępność i koszt wydajnościowy. Nie kopiuj ich warstwy wizualnej.

## 9. 3D i WebGL

- 3D stosuj tylko wtedy, gdy przekazuje informację, której prostsza forma nie pokazuje równie dobrze.
- Finalne modele buduj lub generuj lokalnie w narzędziach open source wskazanych w rejestrze generatorów.
- Poly Haven jest dozwolone wyłącznie dla zweryfikowanych tekstur i HDRI CC0; modele z biblioteki są wyłączone.
- Zapisuj narzędzie, wersję, prompt lub parametry, seed, checkpoint, wejścia, licencje i zakres ręcznej obróbki.
- Ustal limit DPR, zatrzymuj render loop poza viewportem, zwalniaj zasoby GPU i zapewnij statyczny fallback.
- Nie używaj generycznych brył jako substytutu art direction.

## 10. Prezentacje

- Jeden slajd przekazuje jedną tezę. Tytuł slajdu powinien już komunikować wniosek.
- Ustal narrację przed layoutem: problem, dowód, znaczenie, decyzja lub następny krok.
- Używaj jednej siatki, stałych marginesów i powtarzalnych typów slajdów.
- Wykres pokazuje jeden główny wniosek, ma jednostki, źródło i wyróżnioną serię. Tabela trafia na slajd tylko wtedy, gdy porównanie wymaga dokładnych wartości.
- Nie używaj drobnego tekstu ani długich akapitów. Notatki prelegenta nie zastępują informacji koniecznej do zrozumienia slajdu.
- Animacja slajdu porządkuje kolejność, nie służy jako ozdoba.

## 11. Dostępność i odporność

- Celem dla stron i aplikacji jest WCAG 2.2 AA.
- Zapewnij logiczną kolejność fokusu, widoczny `:focus-visible`, skip link, poprawny `lang`, etykiety i alternatywy tekstowe.
- Kontrast tekstu wynosi co najmniej 4.5:1, dużego tekstu 3:1, a istotnych granic i stanów UI 3:1.
- Treść i akcje mają działać bez animacji; podstawowa treść strony pozostaje dostępna bez JavaScriptu.
- Obsłuż wolną sieć, brak mediów, błąd komponentu i puste dane bez blokowania całego rezultatu.

## 12. Wydajność

- Cele terenowe na 75. percentylu: LCP ≤ 2.5 s, INP ≤ 200 ms, CLS ≤ 0.1.
- Rezerwuj wymiary mediów, lazy-loaduj treść poniżej pierwszego viewportu i dziel ciężki JavaScript.
- Nie importuj biblioteki, jeśli CSS, platformowe API albo mały SVG wystarczą.
- Fonty i obraz hero nie mogą powodować widocznych przesunięć layoutu.
- Mierz telefon i desktop; test laboratoryjny nie zastępuje pomiaru terenowego.

## 13. Provenance

Przed integracją utwórz rekord na podstawie `templates/component-record.json`. Każdy element zapisuje:

- typ pochodzenia: `approved-source` albo `open-source-generated`;
- URL, autora, repozytorium, commit lub wersję i datę weryfikacji;
- licencję kodu oraz osobne licencje fontów, ikon, mediów i danych;
- zakres modyfikacji, zależności, fallback i wariant reduced motion;
- dla generacji: narzędzie, model/checkpoint, prompt lub parametry, wejścia i prawa do outputu.

Brak pełnego provenance oznacza `reference-only` i zakaz integracji.

## 14. Proces wykonania

1. Przeczytaj ten dokument i brief użytkownika.
2. Wybierz treść oraz strukturę bez efektów.
3. Znajdź minimalny zestaw elementów w zatwierdzonych rejestrach.
4. Sprawdź licencję każdego komponentu i assetu; zapisz provenance.
5. Zbuduj semantyczny, responsywny wariant bazowy.
6. Dodaj interakcje i ruch tylko tam, gdzie poprawiają zrozumienie.
7. Przetestuj klawiaturę, zoom, reduced motion, telefon, błędy i wydajność.
8. Przejdź `templates/web-quality-checklist.md` dla stron lub równoważną kontrolę dla prezentacji i treści.
9. Uruchom właściwy build, typecheck, testy i `pwsh ./tools/validate.ps1`.

## 15. Definicja ukończenia

Rezultat jest gotowy dopiero wtedy, gdy:

- realizuje brief i ma czytelną hierarchię bez efektów;
- wszystkie komponenty i assety pochodzą z zatwierdzonych źródeł lub lokalnych narzędzi open source;
- nie zawiera Pro, nieznanej licencji ani materiałów skopiowanych z inspiracji;
- działa na klawiaturze, telefonie, przy zoomie 200% i reduced motion;
- mieści się w uzasadnionym budżecie wydajności;
- ma kompletne provenance i przechodzi walidację repozytorium.

Materiały normatywne: [WCAG 2.2](https://www.w3.org/TR/WCAG22/), [WAI Understanding WCAG](https://www.w3.org/WAI/WCAG22/understanding/), [ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/) oraz [Core Web Vitals](https://web.dev/articles/defining-core-web-vitals-thresholds).
