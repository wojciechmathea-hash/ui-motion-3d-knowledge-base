# Pakiety i źródła palet kolorów

Rejestr maszynowy: `catalog/color-palette-registry.json`. Wszystkie pozycje są open source i służą do instalacji na żądanie. Nie są automatycznie zależnościami każdego projektu.

| Pakiet | Wersja zweryfikowana | Licencja | Główne zastosowanie |
|---|---:|---|---|
| [`@radix-ui/colors`](https://github.com/radix-ui/colors) | 3.0.0 | MIT | Gotowe skale UI ze zdefiniowanymi rolami kroków |
| [`@adobe/leonardo-contrast-colors`](https://github.com/adobe/leonardo) | 1.1.0 | Apache-2.0 | Adaptacyjne skale tworzone od wymaganego kontrastu |
| [`@material/material-color-utilities`](https://github.com/material-foundation/material-color-utilities) | 0.4.0 | Apache-2.0 | Tonalne palety, HCT i dynamiczne schematy light/dark |
| [`@primer/primitives`](https://github.com/primer/primitives) | 11.10.0 | MIT | Referencyjna architektura prymitywów i tokenów semantycznych |
| [`open-props`](https://github.com/argyleink/open-props) | 1.7.23 | MIT | Modułowe CSS custom properties do lekkich prototypów |
| [`culori`](https://github.com/Evercoder/culori) | 4.0.2 | MIT | Konwersje, interpolacje, gamut i skale OKLCH |
| [`colorjs.io`](https://github.com/color-js/color.js) | 0.7.1 | MIT | CSS Color 4/5, szeroki gamut, kontrast i różnice kolorów |

## Bramka użycia

1. Wybierz jeden pakiet odpowiadający rzeczywistej potrzebie.
2. Przypnij wersję i zachowaj tekst licencji w projekcie.
3. Przemapuj wynik na role opisane w `knowledge/color-palette-practices.md`.
4. Sprawdź kontrast finalnych par w renderowanym interfejsie.
5. Zapisz pakiet, wersję, licencję, użyte funkcje i wynik testów w provenance.

Pakiet pomaga wygenerować lub dostarczyć kolory; nie zatwierdza za projektanta hierarchii, brandingu ani dostępności całego ekranu.
