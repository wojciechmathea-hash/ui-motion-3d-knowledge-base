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

Lokalnie można pisać wyłącznie **niewizualny kod integracyjny**: semantyczne wrappery, routing, pobieranie i wiązanie danych, zarządzanie stanem, obsługę błędów, atrybuty dostępności oraz testy. Taki kod nie może samodzielnie ustanawiać wyglądu, układu, ruchu ani charakteru komponentu.

Niedozwolone są:

- komponenty, assety i szablony Pro lub premium;
- kod, screenshoty, opisy, filmy i assety skopiowane z witryn inspiracyjnych;
- materiały o nieznanej licencji lub bez możliwego do wskazania autora i URL;
- rezultaty generatorów SaaS jako źródło finalnych komponentów lub assetów, chyba że użytkownik jawnie zmieni tę zasadę;
- scraping marketplace’ów i kopiowanie identyfikacji wizualnej cudzej marki;
- Polygen oraz przypadkowe biblioteki gotowych brył low-poly/voxel jako źródło finalnych modeli 3D.

`catalog/scrollytelling-inspiration-registry.json` jest wyłącznie rejestrem **do analizy**. Żadna pozycja z tego rejestru nie staje się przez to źródłem kodu, tekstów ani assetów.

## 2A. TRYB SOURCE-LOCKED — zero autorskiej interpretacji wizualnej agenta

Tryb `source-locked` jest domyślny i obowiązkowy. **BRAK ŹRÓDŁA = BRAK ELEMENTU.** Agent nie może uzupełniać luk własnym projektem, stylistycznym domysłem ani wygenerowanym ad hoc zamiennikiem.

Każdy widoczny albo interaktywny element rezultatu musi przed implementacją wskazywać istniejący rekord w repozytorium i bazie danych. Dotyczy to w szczególności:

- całych układów stron i sekcji, nawigacji, hero, stopek, kart, tabel, formularzy i kontrolek;
- typografii, ikon, ilustracji, zdjęć, wideo, tekstur, modeli, wykresów i sposobu prezentacji danych;
- animacji, zachowania scroll, przejść, kursorów, hoverów, focusów oraz innych efektów;
- gradientów, teł, ramek, ornamentów, plam, orbit, siatek, przypadkowych figur i wszystkich elementów dekoracyjnych.

Dla każdego elementu manifest musi podać co najmniej: `registryId`, dokładny plik lub nazwę komponentu upstream, URL źródła, commit albo wersję, licencję, dozwoloną adaptację i rekord provenance. Sam fakt, że coś znajduje się w `projects/`, na zrzucie ekranu lub w poprzedniej realizacji, nie czyni tego zatwierdzonym źródłem. Projekt może być źródłem dopiero wtedy, gdy jego używany element ma własny kompletny rekord wskazujący zatwierdzony upstream.

Przed napisaniem kodu wizualnego utwórz w projekcie `SOURCE_LOCK_MANIFEST.md` na podstawie `templates/source-lock-manifest.md`. Manifest ma pokrywać 100% elementów widocznych i interaktywnych. Wpis `local-original`, brak rekordu albo pozycja `reference-only` oznacza przerwanie budowy do czasu uzupełnienia i zweryfikowania bazy.

Agent może adaptować komponent wyłącznie w zakresie przewidzianym przez manifest: podmiana prawdziwej treści, mapowanie istniejących tokenów, responsywność, dostępność, reduced motion i integracja danych. Nie może zmieniać go w nową formę wizualną, projektować alternatywnego układu ani dokładać ozdobników nieobecnych w źródle.

Wynik lokalnego generatora open source wolno włączyć dopiero po zapisaniu go w repozytorium i utworzeniu pełnego rekordu provenance. Generowanie assetu bezpośrednio do budowanej strony oraz tworzenie wizualnego fallbacku przez agenta jest zabronione. Gdy źródłowy element nie ma dozwolonego fallbacku, użyj prostego natywnego HTML bez autorskiej stylizacji albo pomiń moduł.

Jedna realizacja używa jednej głównej rodziny komponentów lub jednego zarejestrowanego systemu wizualnego. Łączenie rodzin wymaga zapisanej w manifeście zgodności tokenów i konkretnej potrzeby, której główna rodzina nie pokrywa. Dostępność wielu efektów nie jest powodem ich łączenia.

Odstępstwo jest możliwe tylko na jednoznaczne polecenie użytkownika, zapisane w manifeście dla konkretnie wskazanego elementu. Ogólne polecenia „stwórz”, „ulepsz” lub „zrób high-end” nie zezwalają agentowi na autorską interpretację wizualną.

## 3. Brief obowiązkowy

Przed tworzeniem zapisz krótko:

- odbiorcę i jego główne zadanie;
- jeden główny komunikat i jedną główną akcję;
- format rezultatu i kontekst użycia;
- hierarchię treści lub rozdziały narracji;
- mapę interakcji: komponent, korzyść dla użytkownika, stan bez ruchu i fallback bez JavaScriptu;
- ograniczenia techniczne, licencyjne, dostępnościowe i wydajnościowe;
- kryteria ukończenia i sposób weryfikacji.

Jeżeli informacji brakuje, przygotuj kompletną, neutralną treść opartą na zweryfikowanych faktach albo pomiń dany moduł. Nie maskuj braków przypadkowymi efektami i nie zostawiaj placeholderów.

## 4. Treść i narracja

- Pisz od wniosku do uzasadnienia. Jeden akapit powinien realizować jedną myśl.
- Używaj konkretnych nagłówków, czasowników i etykiet opisujących rezultat działania.
- Nie twórz fikcyjnych danych wyglądających jak fakty. Dane demonstracyjne oznacz wprost.
- Finalny rezultat nie zawiera placeholderów: `Lorem ipsum`, `TODO`, `TBD`, „coming soon”, pustych kart, atrap zdjęć, niedziałających `#`-linków, nieaktywnych CTA, fikcyjnych logo, osób, opinii ani metryk. Placeholder pola formularza nie zastępuje widocznej etykiety; w gotowym projekcie używaj etykiety i opcjonalnego tekstu pomocniczego.
- Gdy brakuje materiału klienta, napisz pełną roboczą treść zgodną z briefem i oznacz tylko rzeczywiście demonstracyjne dane. Nie zostawiaj użytkownikowi pustych miejsc do późniejszego wypełnienia.
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
- Paletę buduj jako system prymitywów i ról semantycznych (`background`, `surface`, `text`, `muted`, `border`, `brand`, `on-brand`, `focus`, statusy), zgodnie z `knowledge/color-palette-practices.md`. Komponenty nie używają przypadkowych surowych wartości.
- Pakiety kolorystyczne wybieraj wyłącznie z `catalog/color-palette-registry.json`, instaluj na żądanie i zawsze mapuj na role projektu. Gotowa skala nie zwalnia z testu kontrastu finalnych par.
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
- Strona lub UI ma być maksymalnie interaktywne w granicach celu: każdy obszar, który może sensownie oferować wybór, porównanie, ujawnienie, filtr, podgląd, zmianę stanu lub bezpośredni feedback, powinien to robić. Nie zamieniaj jednak treści w zestaw zbędnych kontrolek.
- Interakcje muszą być odkrywalne, działać myszą, dotykiem i klawiaturą, mieć jednoznaczny stan oraz zachować użyteczną wersję bazową bez JavaScriptu.
- Dla pełnej witryny rozważ obowiązkowo cały ekosystem komponentów: nawigację z aktywnym stanem lub nawigator sekcji, funkcjonalne hero, moduły wyboru i eksploracji treści, FAQ/disclosure, kontekstowe CTA oraz stopkę z prawdziwymi linkami, kontaktem i informacjami wymaganymi przez produkt. Wybierz wszystkie elementy, które mają wartość w konkretnym briefie.
- Hero może zawierać wideo, animowaną wizualizację, demo produktu lub interaktywny podgląd tylko wtedy, gdy jest to finalny, licencjonowany materiał z zatwierdzonego źródła albo lokalnej generacji open source. Wideo ma poster, napisy gdy występuje mowa, sterowanie/pauzę, `muted` i `playsinline` przy autoplay oraz nieruchomy wariant dla reduced motion i wolnej sieci.
- Stopka i nawigacja nie są dekoracją. Muszą zawierać prawdziwe, działające cele; niedziałające pozycje, puste grupy i placeholderowe linki są zabronione.
- „High-end development” oznacza dopracowane stany, spójne tokeny, natychmiastowy feedback, wysoką jakość typografii, płynność, dostępność, brak błędów i rozsądny budżet wydajności — nie natłok gradientów, efektów, bibliotek lub ruchu.
- Maksymalizuj **wartość i pokrycie interakcji**, nie ich surową liczbę. Jeżeli dwa komponenty rozwiązują to samo albo zwiększają obciążenie poznawcze klienta, zostaw prostszy i lepiej dopracowany wariant.
- Projektuj mobile-first i testuj przynajmniej szerokości 320/390, 768, 1280 i 1440 CSS px oraz zoom 200%.
- Podstawowa akcja nie może zależeć wyłącznie od hover, drag, WebGL ani animacji.

## 8. Motion i scrollytelling

- Scroll użytkownika pozostaje natywny. Nie przechwytuj go, nie spowalniaj i nie ukrywaj paska przewijania.
- Najpierw przygotuj czytelny dokument; sticky, parallax i przejścia są warstwą ulepszającą.
- Jedna scena sticky ma jeden cel i stabilne stany wynikające z aktywnego rozdziału.
- Animuj głównie `transform` i `opacity`; ogranicz pracę wykonywaną w zdarzeniu scroll.
- Każdy ruch musi komunikować zmianę stanu, hierarchię, kierunek lub relację. Ruch wyłącznie dekoracyjny usuń.
- Animacje są domyślnie subtelne: dla mikrointerakcji zwykle `120–240 ms`, dla ujawnień i zmian układu `240–450 ms`, z przesunięciem najczęściej `4–16 px`. Dłuższy ruch wymaga funkcji narracyjnej; ciągłe pętle wymagają wyraźnego uzasadnienia.
- Maksymalizuj responsywność na działanie użytkownika, nie liczbę poruszających się elementów. Hover, press, focus, wybór, rozwinięcie i zmiana danych powinny otrzymywać szybki, spokojny feedback.
- Ruch całej strony powinien mieć wspólny język: kilka powtarzalnych krzywych easing, czasów i odległości. „Schludnie i profesjonalnie” ma pierwszeństwo przed demonstracją liczby dostępnych efektów.
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
2. Wybierz treść oraz strukturę wyłącznie spośród zarejestrowanych układów i wzorców źródłowych.
3. Utwórz `SOURCE_LOCK_MANIFEST.md` i przypisz każdy widoczny oraz interaktywny element do konkretnego rekordu i pliku upstream.
4. Zweryfikuj 100% pokrycia manifestu. Przy braku źródła zatrzymaj budowę i najpierw uzupełnij bazę.
5. Sprawdź licencję każdego komponentu i assetu; zapisz provenance.
6. Zbuduj semantyczny, responsywny wariant bazowy, ograniczając kod lokalny do niewizualnej integracji.
7. Dodaj tylko interakcje i ruch wskazane przez użyte komponenty źródłowe oraz manifest.
8. Przetestuj klawiaturę, zoom, reduced motion, telefon, błędy i wydajność.
9. Przejdź `templates/web-quality-checklist.md` dla stron lub równoważną kontrolę dla prezentacji i treści.
10. Uruchom właściwy build, typecheck, testy i `pwsh ./tools/validate.ps1`.

## 15. Definicja ukończenia

Rezultat jest gotowy dopiero wtedy, gdy:

- realizuje brief i ma czytelną hierarchię bez efektów;
- ma `SOURCE_LOCK_MANIFEST.md` pokrywający 100% elementów widocznych i interaktywnych, bez wpisów `local-original` i `reference-only`;
- wszystkie komponenty i assety pochodzą z zatwierdzonych źródeł lub lokalnych narzędzi open source;
- nie zawiera Pro, nieznanej licencji ani materiałów skopiowanych z inspiracji;
- nie zawiera placeholderów, atrap treści, pustych modułów ani niedziałających akcji;
- wykorzystuje sensowne możliwości interakcji i odpowiada na działanie użytkownika subtelną animacją lub innym jednoznacznym feedbackiem;
- działa na klawiaturze, telefonie, przy zoomie 200% i reduced motion;
- mieści się w uzasadnionym budżecie wydajności;
- ma kompletne provenance i przechodzi walidację repozytorium.

Materiały normatywne: [WCAG 2.2](https://www.w3.org/TR/WCAG22/), [WAI Understanding WCAG](https://www.w3.org/WAI/WCAG22/understanding/), [ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/) oraz [Core Web Vitals](https://web.dev/articles/defining-core-web-vitals-thresholds).
