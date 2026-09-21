# Web quality gate — Source Locked Showcase

## Cel i treść

- [x] Odbiorca, zadanie i główna akcja są zapisane w `BRIEF.md`.
- [x] Kolejność treści jest zrozumiała bez animacji i JavaScriptu.
- [x] Metryki odpowiadają `catalog/generated-summary.json` i lokalnemu upstreamowi Magic UI.
- [x] Nie ma placeholderów, atrap mediów, pustych modułów ani niedziałających linków.
- [x] Strona ma jeden `h1`, logiczne nagłówki i semantyczny `main`.

## UI i responsywność

- [x] Komponenty korzystają ze wspólnych tokenów Radix Colors i typografii Manrope.
- [x] Role tekstu, tła, akcji, obramowania i fokusu są semantyczne.
- [x] Układ ma warianty mobilne i desktopowe bez poziomego overflow.
- [x] Touch targety kluczowych kontrolek mają około 40–44 px.
- [x] Hover nie jest jedyną drogą do treści ani działania.
- [x] Nawigacja i CTA prowadzą do rzeczywistych celów.
- [x] Elementy interaktywne mają różne funkcje i nie tworzą natłoku.

## Dostępność

- [x] Dokument ma `lang="pl"`, skip link i widoczny fokus.
- [x] Tabs, Accordion, Dock i nawigacja działają klawiaturą.
- [x] Ikony dekoracyjne mają `aria-hidden`, a linki ikonowe dostępne nazwy.
- [x] Reduced motion usuwa smooth scroll i skraca animacje; Text Reveal ma wariant statyczny.
- [x] Główna treść pozostaje czytelna bez JavaScriptu.

## Motion i scrollytelling

- [x] Natywny scroll nie jest przechwytywany.
- [x] ScrollProgress i TextReveal komunikują postęp dokumentu.
- [x] Każdy rozdział pozostaje samodzielnie czytelny.
- [x] MotionConfig respektuje preferencję reduced motion.
- [x] Brak WebGL, canvas i 3D.

## Wydajność i technika

- [x] Produkcyjny build, TypeScript i lint przechodzą.
- [x] Strona eksportuje się statycznie do `out/`.
- [x] Brak mediów powodujących CLS.
- [x] Brak ciężkich rendererów i handlerów przechwytujących scroll.

## Pochodzenie

- [x] `SOURCE_LOCK_MANIFEST.md` powstał przed implementacją.
- [x] Manifest obejmuje 100% elementów widocznych i interaktywnych.
- [x] Każdy wpis ma registry ID, plik upstream, URL, wersję, licencję, zakres adaptacji i provenance.
- [x] Nie ma autorskich kształtów, układów, efektów ani wizualnych fallbacków agenta.
- [x] Magic UI Free jest jedną główną rodziną komponentów.
- [x] Wszystkie licencje i rekordy provenance są obecne lokalnie.
