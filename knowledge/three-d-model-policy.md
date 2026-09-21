# Polityka modeli 3D

Status: materiał pomocniczy do sekcji 3D w `CREATION_STANDARD.md`. W razie sprzeczności obowiązuje dokument nadrzędny.

## Reguła nadrzędna

Do projektów nie importujemy gotowych modeli z **Polygen (`polygen.app`)** ani generycznych katalogów low-poly/voxel. Proste, przypadkowe bryły nie są akceptowanym finalnym językiem wizualnym.

- Prymitywy geometryczne mogą służyć wyłącznie jako placeholder, test materiału albo debug sceny.
- Poly Haven pozostaje dozwolony tylko dla zweryfikowanych tekstur i HDRI CC0; nie jest źródłem modeli w tym workflow.
- Khronos glTF Sample Assets i Babylon Assets służą wyłącznie do testów kompatybilności, nie jako finalna warstwa wizualna.
- Finalny model ma być wygenerowany lub zbudowany dla konkretnego projektu przy użyciu lokalnego generatora open source z `catalog/generator-registry.json`.

## Zatwierdzone ścieżki generowania

| Potrzeba | Generator open source | Uwaga |
|---|---|---|
| art-directed / procedural | Blender Geometry Nodes, Sverchok | preferowana ścieżka dla własnego stylu |
| parametryczne CAD | OpenSCAD, CadQuery | dobre dla kontrolowanej geometrii |
| obraz → model | TripoSR, InstantMesh, TRELLIS | wymagają kontroli checkpointu i praw do obrazu |
| tekst/obraz → model | Shap-E, TRELLIS | wynik zawsze wymaga art direction, retopologii i QA |

„Open source” dotyczy kodu generatora. Dla AI trzeba osobno sprawdzić licencję checkpointu, zależności, dane wejściowe i warunki outputu.

## Wymagany workflow

1. Zapisz cel modelu, styl, widoki referencyjne i ograniczenia techniczne.
2. Wybierz generator z trybem `local-open-source` i kategorią 3D w rejestrze.
3. Zapisz repozytorium, commit/wersję, licencję kodu, checkpoint, prompt/parametry i źródła wejściowe.
4. Oceń sylwetkę, proporcje, topologię, UV, materiały, skalę i zachowanie w animacji.
5. Wykonaj własną korektę w Blenderze; nie publikuj surowego wyniku generatora jako gotowego assetu.
6. Wyeksportuj zoptymalizowany GLB/glTF, ustaw budżet polygonów i tekstur oraz przygotuj statyczny fallback.
7. Dołącz rekord provenance zgodny z `templates/component-record.json`.

## Kryterium odrzucenia

Model jest odrzucany, gdy wygląda jak przypadkowy voxel/low-poly placeholder, nie ma spójnego stylu z produktem, ma nieznane prawa do checkpointu lub danych wejściowych, albo nie przechodzi kontroli topologii i wydajności.
