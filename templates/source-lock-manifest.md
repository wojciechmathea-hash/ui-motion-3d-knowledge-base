# Source-lock manifest

Status: obowiązkowy dokument projektowy do `CREATION_STANDARD.md`. Utwórz go **przed** implementacją jako `SOURCE_LOCK_MANIFEST.md` w katalogu projektu.

## Główna rodzina wizualna

| Pole | Wartość |
|---|---|
| Registry ID | |
| Nazwa systemu / biblioteki | |
| Dokładny upstream path | |
| URL | |
| Commit / wersja | |
| Licencja | |
| Użyte tokeny / motyw źródłowy | |

## Mapa elementów

Każdy element widoczny lub interaktywny musi mieć osobny wpis albo należeć do jawnie wskazanego kompletnego komponentu źródłowego. `local-original`, `reference-only` i puste pola są niedozwolone.

| Obszar / selektor | Element lub komponent | Registry ID | Upstream: dokładny plik / eksport | URL | Commit / wersja | Licencja | Dozwolona adaptacja | Provenance record |
|---|---|---|---|---|---|---|---|---|
| | | | | | | | | |

## Niewizualny kod integracyjny

Wymień wyłącznie semantyczne wrappery, routing, wiązanie danych, stan, obsługę błędów, atrybuty dostępności i testy. Ten kod nie może ustanawiać wyglądu, układu, animacji ani dekoracji.

| Plik | Zakres techniczny | Dlaczego nie tworzy nowego elementu wizualnego |
|---|---|---|
| | | |

## Kontrola przed implementacją

- [ ] 100% elementów widocznych i interaktywnych ma rekord źródłowy.
- [ ] Nie ma wpisu `local-original` ani źródła `reference-only`.
- [ ] Nie ma autorskich dekoracji, gradientów, figur, teł, ikon, ilustracji, ruchu ani układów agenta.
- [ ] Generowane assety zostały najpierw zapisane w repozytorium z pełnym provenance.
- [ ] Jedna główna rodzina komponentów zapewnia spójność strony.
- [ ] Każde źródło dodatkowe pokrywa brakującą funkcję i ma udokumentowaną zgodność tokenów.
- [ ] Każda adaptacja mieści się w zakresie: treść, istniejące tokeny, responsywność, dostępność, reduced motion i integracja danych.

## Kontrola po implementacji

- [ ] Audyt DOM i CSS nie wykazał elementów spoza manifestu.
- [ ] Fallbacki pochodzą ze źródła albo są prostym natywnym HTML bez autorskiej warstwy wizualnej.
- [ ] Projekt nie traktuje wcześniejszej realizacji z `projects/` jako samodzielnego źródła.
- [ ] Wszystkie rekordy provenance i licencje są obecne w projekcie.
