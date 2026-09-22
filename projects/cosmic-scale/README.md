# Kosmos w skali

Samowystarczalna, interaktywna strona scrollytelling o zmianie skali obserwacji: od Ziemi widzianej znad Księżyca po Drogę Mleczną i głębokie pole.

## Uruchomienie bez Node.js

1. Rozpakuj cały katalog.
2. Otwórz `index.html` w aktualnej wersji Chrome, Edge, Firefox albo Safari.

Wszystkie skrypty, fonty i obrazy są lokalne. Strona nie pobiera pakietów z CDN i nie wymaga instalacji zależności. Jeśli przeglądarka lub urządzenie nie udostępnia WebGL, pod animowanym polem znajduje się lokalna statyczna grafika NASA, a pełna treść i nawigacja pozostają w DOM.

## Interakcje

- przewijanie uruchamia sekwencyjne wejścia rozdziałów i treści;
- nawigacja, rail i cztery karty rozdziałów prowadzą do konkretnych etapów;
- pole Galaxy subtelnie reaguje na wskaźnik;
- karty atlasu reagują na hover oraz fokus klawiatury;
- menu mobilne obsługuje klawiaturę i Escape;
- `prefers-reduced-motion` zatrzymuje ruch tła oraz skraca animacje.

## Pochodzenie

Każdy widoczny lub interaktywny element jest przypisany do zatwierdzonego źródła w `SOURCE_LOCK_MANIFEST.md` i rekordach `provenance/`. Licencje i zasady wykorzystania znajdują się w `THIRD_PARTY_NOTICES.md` oraz `licenses/`.
