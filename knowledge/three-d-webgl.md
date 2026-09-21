# 3D, WebGL i shadery

Status: materiał pomocniczy do `CREATION_STANDARD.md`; nie stanowi osobnej instrukcji.

Źródła i tworzenie modeli podlegają obowiązkowo `three-d-model-policy.md`. Nie używamy Polygen ani generycznych gotowych brył low-poly/voxel; finalny model ma powstać w zatwierdzonym generatorze open source.

## Kiedy używać

3D ma sens, gdy głębia, materiał, przestrzeń albo bezpośrednia manipulacja są częścią komunikatu. Jeśli efekt można równie dobrze wyrazić gradientem lub SVG, prostsza technika będzie zwykle lepsza.

## Budżet techniczny

- Ogranicz DPR, np. `min(devicePixelRatio, 1.5)` na urządzeniach mobilnych.
- Pauzuj render loop po opuszczeniu viewportu i w ukrytej karcie.
- Unikaj wielu pełnoekranowych canvasów.
- Mierz czas GPU, liczbę draw calls, wielkość tekstur i transfer modeli.
- Kompresuj tekstury i modele; lazy-loaduj doświadczenie.
- Dodaj screenshot, CSS lub SVG jako fallback.

## Interakcja

- Zapewnij sterowanie klawiaturą dla funkcji, nie tylko dla dekoracji.
- Pointer tracking powinien być filtrowany i ograniczony.
- Na touch zmień affordance zamiast emulować hover.
- Nie przechwytuj scrolla bez jednoznacznej potrzeby.

## Bezpieczeństwo wizualne

Kontroluj błyski, duże kontrastowe zmiany i szybkość ruchu. Tekst powinien mieć stabilne tło lub warstwę scrim. Scena nigdy nie może zasłaniać działania podstawowego.
