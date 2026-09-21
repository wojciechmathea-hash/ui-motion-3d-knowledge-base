# Instrukcje dla agentów

To repozytorium jest prywatną bazą wiedzy do projektowania UI, motion i doświadczeń 3D.

## Kolejność pracy

1. Przeczytaj odpowiedni rejestr: `catalog/source-registry.json`, `catalog/generator-registry.json` albo `catalog/learning-repository-registry.json`, a następnie właściwy katalog w `docs/`.
2. Wybierz najmniejszą liczbę bibliotek potrzebną do danego efektu.
3. Sprawdź pole `redistribution` i licencję przed skopiowaniem kodu albo assetu.
4. Zapisz provenance według `templates/component-record.json`.
5. Zadbaj o reduced motion, obsługę klawiatury, kontrast, wydajność mobilną i fallback bez WebGL.

## Dozwolone użycie źródeł

- `upstream/threeui`, `upstream/animejs` i `upstream/magicui`: można analizować i adaptować zgodnie z dołączonymi licencjami.
- `upstream/react-bits`: używać wyłącznie jako element końcowej aplikacji lub strony. Nie budować z niego osobnej biblioteki, paczki, marketplace’u ani portu.
- `upstream/21st-skill`: używać jako narzędzia do jawnego wyszukiwania i pobierania wybranych elementów. Każdy wynik wymaga osobnej kontroli licencji.
- `upstream/curated/*`: wybrane darmowe upstreamy UI, motion, 3D, tabel i ikon. Używać zgodnie z licencją wskazaną w rejestrze i plikiem licencji w danym submodule.
- Magic UI Pro: nie kopiować kodu, template’ów ani assetów do tej bazy. Można zapisać nazwę, kategorię i link do produktu.
- 21st.dev: nie scrapować ani nie kopiować demo, screenshotów, filmów, miniaturek, opisów lub całego katalogu. Korzystać z oficjalnego UI/API/CLI i tylko dla wybranych elementów.
- Poly Haven: pobierać ręcznie lub przez oficjalne API, nie przez scraping strony. Assety są CC0, ale kod klienta API ma osobną licencję.
- Khronos glTF Sample Assets i Babylon.js Assets: licencja jest sprawdzana i zapisywana osobno dla każdego pliku; nazwa kolekcji nie wystarcza.
- Generatory SaaS: korzystać wyłącznie z aktualnego bezpłatnego limitu. Przed produkcyjnym użyciem ponownie sprawdzić plan, prywatność, watermark i prawa do outputu.
- Generatory lokalne AI: licencja interfejsu nie obejmuje modelu, checkpointu, LoRA, custom node ani danych wejściowych.
- Repozytoria edukacyjne: kopiować tylko minimalny fragment po kontroli licencji. Assety demo nie dziedziczą automatycznie licencji kodu.

## Reguły projektowe

- Motion ma komunikować zmianę stanu, hierarchię albo relację przestrzenną; efekt dekoracyjny jest drugorzędny.
- Jeden dominujący efekt na viewport. Nie łącz intensywnego tła, animowanej typografii i śledzenia kursora bez wyraźnego uzasadnienia.
- Dla WebGL przygotuj limit DPR, zatrzymanie render loop poza viewportem i statyczny fallback.
- Każda animacja powinna respektować `prefers-reduced-motion`.
- Nie uzależniaj podstawowej akcji od hover, drag, WebGL lub animacji.
- Nie kopiuj identyfikacji wizualnej, znaków towarowych ani tekstów marketingowych ze źródeł.
- Wykresy i tabele muszą mieć alternatywę tekstową, poprawne etykiety i działać bez kodowania informacji wyłącznie kolorem.
- Zewnętrzny model, tekstura, HDRI, font lub ikona jest osobnym assetem i wymaga własnego wpisu provenance.

## Wymagany provenance

Każdy lokalnie zapisany wzorzec lub komponent powinien mieć: nazwę, źródłowy URL, autora, commit lub wersję, licencję, datę weryfikacji, zakres modyfikacji oraz listę assetów z osobnymi licencjami.

Każdy wygenerowany asset powinien dodatkowo zapisywać: narzędzie i model, plan, prompt lub parametry, źródła wejściowe, widoczność wyniku, watermark i warunki outputu obowiązujące w dniu generowania.
