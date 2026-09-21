# Motion system

## Intencje ruchu

- `feedback`: reakcja na działanie, zwykle 80–180 ms;
- `state-change`: pokazanie zmiany stanu, zwykle 150–300 ms;
- `navigation`: relacja między widokami, zwykle 200–450 ms;
- `attention`: pojedynczy akcent, nie powinien zapętlać się bez powodu;
- `storytelling`: timeline lub scroll, wymagający kontroli tempa i skip/fallbacku.

## Easing

- wejście: ease-out;
- wyjście: ease-in;
- ruch ciągły: linear;
- elementy fizyczne: spring z ograniczonym overshootem;
- elementy krytyczne: bez bounce i bez opóźnienia.

## Dostępność

Przy `prefers-reduced-motion: reduce` usuń parallax, śledzenie kursora, duże transformacje, automatyczne sekwencje i migotanie. Zachowaj natychmiastową zmianę stanu lub krótkie przejście opacity.

## Wydajność

Preferuj `transform` i `opacity`. Nie animuj layoutu w każdej klatce, ogranicz liczbę targetów, odłącz obserwery po użyciu i pauzuj pętle poza viewportem.

