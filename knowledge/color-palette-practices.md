# Dobre praktyki palet kolorów

Status: materiał pomocniczy do `CREATION_STANDARD.md`. Rejestr zatwierdzonych pakietów znajduje się w `catalog/color-palette-registry.json`.

## Zasada podstawowa

Paleta nie jest listą efektownych próbek. Jest systemem powiązań między tłem, powierzchnią, treścią, akcją i stanem. Surowy kolor staje się użyteczny dopiero po przypisaniu do roli i sprawdzeniu we wszystkich miejscach, w których ta rola występuje.

## 1. Najpierw role, potem wartości

Utwórz dwie warstwy tokenów:

1. **prymitywy** — skale neutralne i chromatyczne, np. `neutral-1…12`, `brand-1…12`;
2. **role semantyczne** — np. `bg`, `surface`, `surface-raised`, `text`, `text-muted`, `border`, `brand`, `on-brand`, `focus`, `success`, `warning`, `danger`.

Komponenty korzystają z ról, nigdy bezpośrednio z przypadkowego HEX-a lub numeru skali. Dzięki temu light mode, dark mode i high contrast są odrębnymi mapowaniami tych samych ról, a nie mechanicznym odwróceniem kolorów. Ten model jest zgodny z podejściem [Material Design 3](https://m3.material.io/styles/color/the-color-system/color-roles), [Radix Colors](https://www.radix-ui.com/colors/docs/palette-composition/understanding-the-scale) i [Primer Primitives](https://github.com/primer/primitives).

Minimalny zestaw dla strony:

```css
:root {
  --color-bg: ...;
  --color-surface: ...;
  --color-surface-raised: ...;
  --color-text: ...;
  --color-text-muted: ...;
  --color-border: ...;
  --color-brand: ...;
  --color-on-brand: ...;
  --color-focus: ...;
  --color-success: ...;
  --color-warning: ...;
  --color-danger: ...;
}
```

## 2. Kontrast jest właściwością pary

- tekst standardowy: minimum `4.5:1`;
- duży tekst: minimum `3:1`;
- istotne granice, ikony i stany kontrolek: minimum `3:1`, gdy wymaga tego WCAG;
- wskaźnik fokusu musi być wyraźny na każdej powierzchni, na której występuje;
- stan disabled nie może przenosić informacji wymaganej do ukończenia zadania.

Nie oznaczaj próbki jako „accessible” w oderwaniu od tła. Testuj konkretne pary: `text/surface`, `on-brand/brand`, `focus/bg`, `danger/surface` i każdy stan interaktywny. Źródła normatywne: [WCAG 2.2 — Contrast Minimum](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum), [Use of Color](https://www.w3.org/WAI/WCAG22/Understanding/use-of-color) oraz [Non-text Contrast](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast).

## 3. Kolor wspiera hierarchię

- Większość interfejsu buduj neutralami i powierzchniami; kolor marki rezerwuj dla priorytetowych akcji oraz kluczowych stanów.
- Jeden główny akcent powinien mieć stabilne znaczenie. Nie używaj tego samego koloru raz jako CTA, a raz jako ostrzeżenia.
- Hierarchię twórz również typografią, spacingiem, obramowaniem, ikoną i pozycją. Kolor nie może być jedynym nośnikiem znaczenia.
- Stany `hover`, `active`, `selected`, `focus`, `disabled`, `success`, `warning` i `error` muszą być rozróżnialne oraz opisane poza samą zmianą barwy.
- Gradient jest powierzchnią lub ilustracją, nie zamiennikiem systemu kolorów. Tekst na gradiencie testuj w jego najsłabszym punkcie.

## 4. Skale perceptualne i gamut

Do budowania równych kroków jasności preferuj OKLCH lub narzędzia o porównywalnym modelu perceptualnym. [CSS Color 4](https://www.w3.org/TR/css-color-4/) opisuje `oklab()` i `oklch()`, ale sama przestrzeń nie gwarantuje dobrej palety.

- Kontroluj osobno jasność, chromę i hue.
- Sprawdzaj, czy kolejne kroki faktycznie różnią się w UI, a nie tylko numerycznie.
- Dla Display-P3 przygotuj jawny fallback sRGB, jeśli wymagają tego obsługiwane przeglądarki lub urządzenia.
- Po interpolacji zawsze ponów kontrolę gamutu i kontrastu.

## 5. Light, dark i tryby systemowe

Dark mode nie jest inwersją. Osobno dobierz powierzchnie, kontrast tekstu, nasycenie akcentów, cienie i obramowania. Zadeklaruj wspierane tryby przez `color-scheme`, aby formularze, scrollbar i inne elementy przeglądarki pasowały do motywu. Zobacz [MDN — color-scheme](https://developer.mozilla.org/en-US/docs/Web/CSS/Reference/Properties/color-scheme).

Każdy tryb sprawdź także z:

- `prefers-color-scheme`;
- `forced-colors` / high contrast;
- symulacją protanopii, deuteranopii i tritanopii;
- fokusem klawiatury, zaznaczeniem tekstu i stanami formularzy;
- obrazami, wykresami, przezroczystością oraz nakładającymi się warstwami.

## 6. Dobór pakietu

| Potrzeba | Pakiet startowy |
|---|---|
| Gotowe, opisane skale UI | `@radix-ui/colors` |
| Paleta generowana z docelowego kontrastu | `@adobe/leonardo-contrast-colors` |
| Tonalne light/dark i dynamiczny motyw | `@material/material-color-utilities` |
| Referencja architektury tokenów produkcyjnych | `@primer/primitives` |
| Lekkie custom properties do prototypu | `open-props` |
| Własne skale, konwersje i interpolacje OKLCH | `culori` |
| CSS Color 4/5, gamut i zaawansowane testy koloru | `colorjs.io` |

Nie instaluj kilku pakietów rozwiązujących to samo. Najpierw wybierz model: gotowa skala, generator kontrastowy, dynamiczny motyw albo biblioteka obliczeniowa. Następnie importuj tylko używaną część i zapisz wersję oraz licencję w provenance.

## 7. Procedura zatwierdzenia palety

1. Zdefiniuj charakter marki, kontekst produktu i najważniejszą akcję.
2. Wybierz neutralną skalę oraz najwyżej jeden główny i jeden pomocniczy hue.
3. Zbuduj role semantyczne dla light i dark; dodaj stany statusowe.
4. Sprawdź wszystkie wymagane pary kontrastowe i zapisz wynik.
5. Zastosuj paletę w realnych komponentach, danych i długiej treści — nie tylko na planszy próbek.
6. Przetestuj klawiaturę, forced colors, zaburzenia widzenia barw i minimum dwa typy wyświetlaczy.
7. Usuń kolory bez roli. Zapisz finalne tokeny, wersję pakietu i decyzje w dokumentacji projektu.

Gotowa paleta ma mniej wyjątków niż tokenów, nie wymaga surowych kolorów w komponentach i zachowuje znaczenie bez widzenia barw.
