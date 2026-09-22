# 3D, WebGL i shadery

Status: materiał pomocniczy do `CREATION_STANDARD.md`; nie stanowi osobnej instrukcji.

Źródła i tworzenie modeli podlegają obowiązkowo `three-d-model-policy.md`. Nie używamy Polygen ani generycznych gotowych brył low-poly/voxel; finalny model ma powstać w zatwierdzonym generatorze open source.

## Kiedy używać

3D ma sens, gdy głębia, materiał, przestrzeń albo bezpośrednia manipulacja są częścią komunikatu. Jeśli efekt można równie dobrze wyrazić gradientem lub SVG, prostsza technika będzie zwykle lepsza.

## Wybór techniki

1. Użyj statycznej kompozycji, gdy potrzebny jest wyłącznie kadr z poczuciem głębi.
2. Użyj warstwowego 2.5D w DOM/CSS, gdy kilka wyciętych obrazów ma poruszać się względem scrolla lub kursora.
3. Użyj Canvas 2D, gdy elementów jest wiele, ale nie potrzebujesz kamery, materiałów ani geometrii 3D.
4. Użyj CSS 3D, gdy warstwy DOM mają wspólną perspektywę i prostą transformację w osi Z.
5. Użyj WebGL dopiero dla prawdziwej kamery, map głębi, shaderów, materiałów, geometrii, post-processingu lub dużej liczby elementów renderowanych razem.

Dokładny sposób planowania warstw opisuje `knowledge/visual-depth-layering.md`.

## Budżet techniczny

- Ogranicz DPR, np. `min(devicePixelRatio, 1.5)` na urządzeniach mobilnych.
- Pauzuj render loop po opuszczeniu viewportu i w ukrytej karcie.
- Unikaj wielu pełnoekranowych canvasów.
- Mierz czas GPU, liczbę draw calls, wielkość tekstur i transfer modeli.
- Kompresuj tekstury i modele; lazy-loaduj doświadczenie.
- Dodaj screenshot, CSS lub SVG jako fallback.
- Dla obrazowych planów WebGL mierz pamięć po dekompresji, nie tylko rozmiar pliku. Duże PNG z alfą mogą zużywać wielokrotnie więcej pamięci GPU niż sugeruje transfer.
- Nie uruchamiaj osobnego renderera dla każdej płaszczyzny lub sekcji, jeżeli jedna scena i jeden canvas mogą obsłużyć całość.
- Wstępnie dekoduj lub uploaduj tekstury przed ich pierwszym widocznym kadrem; KTX2 jest preferowaną ścieżką dla dużych zestawów warstw WebGL.

## Interakcja

- Zapewnij sterowanie klawiaturą dla funkcji, nie tylko dla dekoracji.
- Pointer tracking powinien być filtrowany i ograniczony.
- Na touch zmień affordance zamiast emulować hover.
- Nie przechwytuj scrolla bez jednoznacznej potrzeby.

## Bezpieczeństwo wizualne

Kontroluj błyski, duże kontrastowe zmiany i szybkość ruchu. Tekst powinien mieć stabilne tło lub warstwę scrim. Scena nigdy nie może zasłaniać działania podstawowego. Semantyczny DOM i fokus pozostają niezależne od renderera; WebGL jest warstwą immersyjną, nie strukturą dokumentu.
