# Standard budowania witryn

Status: materiał pomocniczy. Jedyną nadrzędną instrukcją dla wszystkich formatów jest `CREATION_STANDARD.md`.

Ten dokument jest obowiązkową bramką projektową dla każdej strony tworzonej z tej bazy. Kolejność priorytetów jest stała:

> zadanie użytkownika → treść → struktura → dostępność → układ → komponenty → ruch → dekoracja

Efekt wizualny nie może zastępować pomysłu, hierarchii ani użyteczności. Domyślnym celem jest WCAG 2.2 na poziomie AA i dobre wartości Core Web Vitals.

## 1. Brief przed kodem

Przed wyborem biblioteki lub komponentu zapisz:

1. odbiorcę i jego główne zadanie;
2. jedną najważniejszą akcję strony;
3. hierarchię treści i kolejność sekcji;
4. kontekst użycia: telefon, desktop, dotyk, klawiatura, wolna sieć;
5. kryteria ukończenia i sposób pomiaru;
6. ograniczenia: licencje, dane, prywatność, budżet wydajności.

Jeśli tych informacji brakuje, powstaje mały, neutralny prototyp treściowy — nie stylizowane demo udające gotowy produkt.

## 2. Struktura i treść

- Używaj semantycznego HTML: `header`, `nav`, `main`, `section`, `article`, `footer`, prawdziwe `button` i `a`.
- Jedna strona ma jeden główny `h1`; poziomy nagłówków opisują hierarchię, nie rozmiar tekstu.
- Najważniejsza informacja i główna akcja muszą być zrozumiałe bez animacji, CSS i WebGL.
- Tekst linku lub przycisku opisuje rezultat działania. Unikaj samych „kliknij”, „więcej” i ikon bez nazwy.
- Nie twórz fikcyjnych statystyk wyglądających jak fakty. Dane demonstracyjne oznacz jako koncepcyjne.
- Długi tekst ma szerokość około 45–75 znaków w wierszu; tekst podstawowy zaczyna się zwykle od 16 px i `line-height` około 1.5–1.75.

## 3. Hierarchia wizualna

- Jeden dominujący komunikat i jeden dominujący akcent na viewport.
- Najpierw ustal skalę typografii, spacing, szerokość kontenera i siatkę; efekty dobieraj na końcu.
- Ogranicz paletę do kolorów funkcjonalnych oraz jednego–dwóch akcentów. Kolor nie może być jedynym nośnikiem znaczenia.
- Używaj wspólnej skali odstępów i tokenów. Komponent zewnętrzny musi zostać przemapowany na tokeny projektu.
- Unikaj przypadkowego „demo look”: szkła na szkle, wielu neonów, wielkiego obrysowanego tekstu, HUD-ów, kul 3D i efektów kursora bez związku z treścią.
- Tekst nie może być przycinany ani ukrywany tylko po to, by uzyskać kompozycję. Dekoracja nigdy nie powoduje poziomego scrolla dokumentu.

## 4. Responsywność

- Projektuj mobile-first i testuj co najmniej 320/390, 768, 1280 i 1440 CSS px.
- Treść i funkcje mają działać przy powiększeniu 200% oraz reflow do szerokości 320 CSS px bez dwukierunkowego przewijania, z wyjątkiem uzasadnionych tabel lub diagramów.
- Nie opieraj krytycznego układu wyłącznie na wysokości viewportu. `100svh` może organizować scenę, ale treść musi się mieścić lub przewijać.
- Obszar dotykowy ma spełniać minimum WCAG 2.2 (24×24 CSS px lub odpowiednie odstępy); wewnętrznym celem dla głównych kontrolek jest co najmniej 44×44 px.
- Hover jest dodatkiem. Na dotyku i klawiaturze musi istnieć równoważny stan lub akcja.

## 5. Dostępność WCAG 2.2 AA

- Kontrast tekstu: co najmniej 4.5:1, a dużego tekstu 3:1. Granice i stany kontrolek muszą mieć co najmniej 3:1 względem sąsiednich kolorów.
- Każda akcja działa z klawiatury, ma logiczną kolejność fokusu i wyraźny `:focus-visible`.
- Sticky header, modal i animowana warstwa nie mogą zasłaniać elementu z fokusem.
- Dodaj „skip link”, poprawny `lang`, tytuł strony, etykiety formularzy i tekstowe alternatywy treści nietekstowej.
- Używaj natywnych elementów przed ARIA. ARIA nie naprawia błędnej semantyki.
- Drag ma alternatywę kliknięciem lub klawiaturą. Zmiana tylko na hover/focus nie może znikać, zanim użytkownik zdąży ją obsłużyć.
- Testuj `prefers-reduced-motion`, forced colors i samą klawiaturę.

Źródło normatywne: [WCAG 2.2](https://www.w3.org/TR/WCAG22/). Pomoc implementacyjna: [WAI Understanding WCAG 2.2](https://www.w3.org/WAI/WCAG22/understanding/) i [ARIA Authoring Practices](https://www.w3.org/WAI/ARIA/apg/).

## 6. Interakcja i komponenty

- Komponent ma rozwiązywać konkretną potrzebę: nawigację, ujawnienie relacji, feedback albo porównanie danych.
- Użyj najmniejszej liczby bibliotek i komponentów. Strona nie jest katalogiem efektów.
- Stan aktywny, loading, empty, error, disabled, focus i reduced-motion są częścią komponentu, nie dodatkiem na końcu.
- Działanie musi dawać natychmiastowy feedback; nie blokuj głównego wątku ciężką animacją.
- Wszystkie lokalnie adaptowane komponenty zapisują źródło, commit/wersję, licencję i zakres zmian.
- Komponent z repozytorium jest punktem wyjścia. Jego styl demo nie przechodzi automatycznie do projektu.

## 7. Motion i scrollytelling

- Nie przechwytuj natywnego scrolla i nie ukrywaj systemowego paska przewijania.
- Każdy rozdział musi być czytelny jako zwykła sekcja dokumentu. Sticky visual jest ulepszeniem, nie jedynym nośnikiem treści.
- Stan wizualizacji wynika z aktywnej sekcji i ma stabilny stan końcowy. Nie animuj wszystkiego przez cały czas.
- Używaj głównie `transform` i `opacity`; unikaj animowania layoutu w każdej klatce.
- Przy `prefers-reduced-motion: reduce` usuń parallax, scramble, duże przesunięcia, automatyczne pętle i płynne przewijanie.
- Na telefonie upraszczaj kompozycję do pionowego układu: wizualizacja nad treścią lub mała ilustracja w sekcji.
- Jedna scena sticky na opowieść. Wielokrotne pełnoekranowe canvasy, 3D i video wymagają osobnego uzasadnienia.

## 8. Progressive enhancement

- Bazowa treść i nawigacja mają pozostać dostępne bez JavaScriptu; skrypty dodają wygodę i ruch.
- Wybieraj feature detection zamiast rozpoznawania przeglądarki.
- Błąd pojedynczego komponentu nie może zasłonić całej strony.
- Grafika dekoracyjna jest ukryta przed czytnikiem, a grafika informacyjna ma tekstowy odpowiednik.

Źródło: [MDN — Progressive enhancement](https://developer.mozilla.org/en-US/docs/Glossary/Progressive_Enhancement) i [MDN — Responsive design](https://developer.mozilla.org/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design).

## 9. Wydajność

Cele terenowe mierzone na 75. percentylu:

| Metryka | Cel „good” |
|---|---:|
| LCP | ≤ 2.5 s |
| INP | ≤ 200 ms |
| CLS | ≤ 0.1 |

Reguły implementacyjne:

- rezerwuj wymiary obrazów i mediów;
- lazy-loaduj treści poza pierwszym viewportem;
- nie ładuj biblioteki, gdy CSS lub mały SVG rozwiązuje problem;
- dziel ciężki JavaScript i ogranicz pracę wykonywaną przy scrollu;
- dla przykładowej strony celuj w maksymalnie około 170 KB gzip JavaScriptu początkowego, chyba że pomiar uzasadnia inny budżet;
- sprawdzaj zarówno Lighthouse/DevTools, jak i dane terenowe — test laboratoryjny nie mierzy pełnego INP.

Źródło progów: [web.dev — Core Web Vitals thresholds](https://web.dev/articles/defining-core-web-vitals-thresholds) oraz [pomiar Web Vitals](https://web.dev/articles/vitals-measurement-getting-started).

## 10. Bramka jakościowa

Strona nie jest gotowa, dopóki nie przejdzie checklisty z `templates/web-quality-checklist.md`. Minimalne testy:

1. build produkcyjny i typecheck;
2. telefon oraz desktop bez overflow i przycinania treści;
3. klawiatura, widoczny fokus i skip link;
4. 200% zoom/reflow;
5. reduced motion;
6. semantyka i nazwy dostępności;
7. kontrast WCAG AA;
8. brak błędów konsoli;
9. kontrola licencji i provenance;
10. przegląd wizualny: czy każdy efekt wspiera treść i czy można go usunąć bez utraty funkcji.

Jeżeli odpowiedź na ostatnie pytanie brzmi „tak”, efekt należy usunąć.
