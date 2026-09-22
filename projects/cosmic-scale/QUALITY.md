# Quality review — Kosmos w skali

Data przeglądu: 2026-09-22.

## Wykonane kontrole

- zweryfikowano lokalne ładowanie wszystkich czterech mediów NASA;
- zweryfikowano pojedynczy canvas WebGL i statyczne tło zapasowe;
- sprawdzono brak poziomego overflow dla rzeczywistych viewportów CSS około 390, 768 i 1440 px;
- sprawdzono mobilne menu, blokadę przewijania podczas otwarcia i przywrócenie po zamknięciu;
- sprawdzono semantyczne nagłówki, linki, etykiety przycisków rail oraz fokusowalne karty atlasu;
- zweryfikowano, że cała treść pozostaje w DOM i nie zależy od WebGL;
- zweryfikowano lokalne bundlowanie bez CDN i importów modułowych wymagających serwera.

## Słabe punkty rozpoznane i poprawione

1. Pierwszy build Galaxy używał klasycznego trybu JSX i zgłaszał `React is not defined`. Bundle przebudowano z automatycznym runtime JSX; canvas działa bez globalnego Reacta.
2. Duże obrazy NASA przekraczały rozsądny koszt dostawy. Zachowano oficjalne kadry, a dwa źródłowe PNG skonwertowano do lokalnego WebP, redukując łączny ciężar o kilka megabajtów.
3. Układ Kage zawierał dekoracyjne foregroundy i renderer świątyni, które nie pasowały do tematu i naruszałyby zasadę braku przypadkowych brył. Foregroundy usunięto, renderer wyłączono, a jedyną warstwą WebGL pozostał zatwierdzony Galaxy.

## Ograniczenia świadome

- animowane tło jest celowo ciemne, aby nie konkurować z tekstem i mediami;
- Galaxy jest dekoracyjne i oznaczone `aria-hidden`; narracja nie przekazuje informacji wyłącznie ruchem;
- screenshoty narzędzia testowego nie przechwytują wiarygodnie skomponowanego canvasa po programowym przewinięciu, dlatego układ dalszych rozdziałów sprawdzono przez aktualne bounding boxy, style i drzewo dostępności;
- politykę użycia mediów należy ponownie zweryfikować przed publikacją komercyjną lub redystrybucją poza tę prywatną stronę.
