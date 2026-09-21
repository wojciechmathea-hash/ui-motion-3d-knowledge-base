# HorizonX — zweryfikowany zakres darmowy

Stan weryfikacji: 2026-09-21.

## Decyzja

[HorizonX](https://horizonx.so) pozostaje w bazie jako źródło `reference-only` oraz katalog jawnie darmowych materiałów procesowych. Nie jest zatwierdzonym źródłem darmowych komponentów, assetów ani eksportów kodu.

Oficjalna strona podaje, że HorizonX jest biblioteką subskrypcyjną bez darmowego tieru pobierania. Dotyczy to także pozycji katalogowych, które nie mają etykiety „Premium”: ich pobranie wykorzystuje limit aktywnego planu. Publiczny podgląd produktu nie daje prawa do skopiowania kodu, projektu, obrazu ani zachowania komponentu.

## Co jest darmowe

| Materiał | Status | Dozwolone użycie w tej bazie |
|---|---|---|
| [Vibe Coding UI Specification](https://horizonx.so/resources/vibe-coding-ui-specification) | strona jawnie zezwala na bezpłatne kopiowanie i adaptację | analiza i adaptacja zasad procesu; nie jest komponentem UI |
| [UI Production Readiness Checklist](https://horizonx.so/resources/vibe-coding-ui-production-readiness) | bezpłatne publiczne narzędzie | link i analiza kryteriów; bez kopiowania aplikacji lub jej kodu |
| [Interactive Tools](https://horizonx.so/tools/about) | edytory i podglądy działają publicznie | wyłącznie ocena możliwości i ręczna analiza; eksport wymaga członkostwa |

## Co jest wyłączone

- komponenty, sekcje, landing pages, UI kits, design systems, assety i pliki Figma z katalogu;
- eksport HTML, React, Svelte oraz „Copy for Figma” z interaktywnych narzędzi;
- produkty niewyróżnione etykietą „Premium”, ponieważ nadal wymagają aktywnej subskrypcji i podlegają dziennemu limitowi pobrań;
- screenshoty, obrazy demonstracyjne, filmy, teksty marketingowe i rekonstrukcja komponentów na podstawie podglądu;
- automatyczne pobieranie i scraping.

## Reguła dla agentów

`horizonx-free-surface` nie może pojawić się w `SOURCE_LOCK_MANIFEST.md` jako źródło komponentu, layoutu, motion, assetu lub dekoracji. Może być cytowane wyłącznie jako materiał procesowy dotyczący specyfikacji i kontroli jakości. Dopóki HorizonX nie opublikuje konkretnego komponentu z bezpłatnym pobraniem i jednoznaczną licencją, liczba zatwierdzonych darmowych komponentów HorizonX wynosi **0**.

## Dowody

- [What is HorizonX?](https://horizonx.so/what-is-horizonx) — model subskrypcyjny, brak darmowego tieru pobierania i brak statusu open source.
- [Pricing](https://horizonx.so/pricing) — eksport narzędzi oraz pliki źródłowe są częścią płatnych planów; pozostałe pozycje katalogu wykorzystują limit dzienny planu.
- [Terms & Conditions](https://horizonx.so/terms) — zakaz redystrybucji, sublicencjonowania, publicznego udostępniania surowych assetów i scrapingu.
- [Tools — About](https://horizonx.so/tools/about) — publiczna konfiguracja i podgląd, lecz eksport pliku jest funkcją członkostwa.
