# Tabele i wizualizacja danych

Status: materiał pomocniczy do `CREATION_STANDARD.md`; nie stanowi osobnej instrukcji.

## Dobór narzędzia

- TanStack Table: gdy wygląd ma być całkowicie własny, a potrzebny jest solidny model sortowania, filtrowania i paginacji.
- Glide Data Grid: gdy liczba komórek jest bardzo duża i potrzebne jest renderowanie canvas oraz edycja arkuszowa.
- Grid.js: gdy potrzebna jest mała, niezależna od frameworka tabela.
- Recharts: gdy projekt jest w React, a wykres ma być szybko skomponowany z komponentów SVG.
- Apache ECharts: gdy potrzebne są mapy, rozbudowane interakcje, streaming lub duże zbiory danych.
- visx: gdy gotowy system wykresów jest zbyt sztywny i potrzebne są prymitywy D3 bez utraty modelu komponentowego React.
- Chart.js: gdy wystarczy prosty, responsywny wykres canvas.
- Tremor: gdy celem jest szybki dashboard React z gotową stylistyką.

## Minimalny standard jakości

- Każdy wykres ma tytuł, opis celu i jednostki.
- Informacja nie może zależeć wyłącznie od koloru; użyj etykiet, kształtów albo wzorów.
- Tooltip jest dodatkiem, nie jedynym sposobem odczytu wartości.
- Dla kluczowych danych zapewnij tabelę lub tekstowe podsumowanie.
- Tabele obsługują klawiaturę, widoczny focus, prawidłowe nagłówki i komunikowanie sortowania.
- Animacja wykresu respektuje `prefers-reduced-motion` i nie opóźnia dostępu do danych.
- Wirtualizację włączaj dopiero po pomiarze; nie może psuć focusu, czytników ekranu ani wyszukiwania.

## Wydajność

SVG jest wygodne i dostępne dla małej lub średniej liczby elementów. Canvas lepiej znosi tysiące punktów, ale wymaga osobnej warstwy dostępności. Dla dużych danych agreguj przed renderem, ogranicz liczbę ticków i nie uruchamiaj animacji przy każdej aktualizacji strumienia.
