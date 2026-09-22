# Audyt jakości — Japan History

Data: 2026-09-22.

## Zakres

- kontrola source-lock i provenance;
- pełny accessibility tree dokumentu;
- wizualny audyt hero oraz kolejnych scen w przeglądarce;
- pomiar bounding boxes dla rozdziału Jōmon, kart stolic i atlasu epok;
- test działających kotwic i nazw navigatora;
- kontrola błędów konsoli;
- kontrola placeholderów, pustych linków i remote media.

## Wyniki

- Nie wykryto placeholderów, pustych `href="#"` ani zdalnie ładowanych mediów.
- Wszystkie 14 WebP, fonty i Three.js są lokalne oraz objęte licencjami projektu.
- Hero, dwa tekstowe plany rozdziału Jōmon, cztery statystyki, trzy kadry stolic oraz pięć wpisów osi czasu nie kolidują na sprawdzonym szerokim viewportcie.
- Nawigacja semantyczna i rail mają polskie, opisowe nazwy; stopka zawiera prawdziwe cele.
- Konsola przeglądarki: 0 błędów i 0 ostrzeżeń.
- Nie zmieniono źródłowych breakpointów, fallbacku `no-webgl`, LOW mode ani reduced motion.

## Trzy wykryte słabości i poprawki

1. Pięcioliterowy napis `JAPAN` wychodził za źródłowy kadr przeznaczony dla krótkiego wordmarku. Zastąpiono go zwięzłym `JPN`, zachowując renderer bez zmian.
2. Boczne przyciski rozdziałów odziedziczyły angielskie nazwy Kage. Zlokalizowano sześć nazw bez zmiany zachowania navigatora.
3. Dłuższa polska treść zwiększała ryzyko kolizji w atlasie epok. Sprawdzono osobno bounding boxes wszystkich pięciu modułów; treść mieści się w źródłowych powierzchniach, więc nie wprowadzano zmian layoutu.

## Ograniczenie audytu

Środowisko podglądu nie udostępniło programowej zmiany viewportu. Mobile i tablet zachowują bez zmian zweryfikowane reguły responsywne komponentu Kage, lecz przed publikacją produkcyjną należy jeszcze wykonać fizyczne screenshoty 390×844 i 768×1024 na docelowych przeglądarkach.
