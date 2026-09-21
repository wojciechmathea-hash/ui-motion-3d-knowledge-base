# Kompozycja UI

## Hierarchia

Najpierw zdefiniuj główne zadanie ekranu, potem dominantę wizualną, a dopiero na końcu efekty. Komponent nie powinien jednocześnie rywalizować kolorem, skalą, ruchem i głębią.

## Gęstość

- Marketing: większy rytm pionowy, jeden cel sekcji, wyraźny CTA.
- Aplikacja: krótszy rytm, stabilne pozycje, motion głównie jako feedback.
- Dashboard: ruch nie może utrudniać porównywania danych.
- Immersive/3D: warstwa treści musi zachować kontrast i priorytet.

## Tokenizacja

Przed integracją obcego komponentu mapuj jego stałe na tokeny: `color`, `surface`, `text`, `border`, `radius`, `space`, `font`, `duration`, `ease`, `shadow`, `z-index`.

## Antywzorce

- składanie całej strony z niepowiązanych efektów demo;
- motion bez stanu końcowego lub celu;
- hero 3D pod tekstem bez kontroli kontrastu;
- komponent zależny wyłącznie od kursora;
- kilkanaście różnych easingów na jednym ekranie;
- kopiowanie tekstu i brandingu z demo.

