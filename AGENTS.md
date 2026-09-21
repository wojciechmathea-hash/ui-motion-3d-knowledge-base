# Instrukcje dla agentów

To repozytorium jest prywatną bazą wiedzy do projektowania UI, motion i doświadczeń 3D.

## Kolejność pracy

1. Przeczytaj `catalog/source-registry.json` i `docs/selection-guide.md`.
2. Wybierz najmniejszą liczbę bibliotek potrzebną do danego efektu.
3. Sprawdź pole `redistribution` i licencję przed skopiowaniem kodu albo assetu.
4. Zapisz provenance według `templates/component-record.json`.
5. Zadbaj o reduced motion, obsługę klawiatury, kontrast, wydajność mobilną i fallback bez WebGL.

## Dozwolone użycie źródeł

- `upstream/threeui`, `upstream/animejs` i `upstream/magicui`: można analizować i adaptować zgodnie z dołączonymi licencjami.
- `upstream/react-bits`: używać wyłącznie jako element końcowej aplikacji lub strony. Nie budować z niego osobnej biblioteki, paczki, marketplace’u ani portu.
- `upstream/21st-skill`: używać jako narzędzia do jawnego wyszukiwania i pobierania wybranych elementów. Każdy wynik wymaga osobnej kontroli licencji.
- Magic UI Pro: nie kopiować kodu, template’ów ani assetów do tej bazy. Można zapisać nazwę, kategorię i link do produktu.
- 21st.dev: nie scrapować ani nie kopiować demo, screenshotów, filmów, miniaturek, opisów lub całego katalogu. Korzystać z oficjalnego UI/API/CLI i tylko dla wybranych elementów.

## Reguły projektowe

- Motion ma komunikować zmianę stanu, hierarchię albo relację przestrzenną; efekt dekoracyjny jest drugorzędny.
- Jeden dominujący efekt na viewport. Nie łącz intensywnego tła, animowanej typografii i śledzenia kursora bez wyraźnego uzasadnienia.
- Dla WebGL przygotuj limit DPR, zatrzymanie render loop poza viewportem i statyczny fallback.
- Każda animacja powinna respektować `prefers-reduced-motion`.
- Nie uzależniaj podstawowej akcji od hover, drag, WebGL lub animacji.
- Nie kopiuj identyfikacji wizualnej, znaków towarowych ani tekstów marketingowych ze źródeł.

## Wymagany provenance

Każdy lokalnie zapisany wzorzec lub komponent powinien mieć: nazwę, źródłowy URL, autora, commit lub wersję, licencję, datę weryfikacji, zakres modyfikacji oraz listę assetów z osobnymi licencjami.

