# Przewodnik wyboru

## Drzewo decyzji

1. Czy efekt ma przekazać zmianę stanu lub poprowadzić uwagę?
   - Tak: zacznij od CSS/Motion albo Anime.js.
   - Nie: sprawdź, czy dekoracja nie pogarsza czytelności i wydajności.
2. Czy potrzebujesz sekwencji, scrubowania, SVG albo wielu targetów?
   - Tak: Anime.js.
   - Jeśli animujesz głównie layout i gesty w React: Motion.
   - Jeśli chcesz tylko płynnie animować dodawanie, usuwanie i zmianę kolejności elementów: AutoAnimate.
3. Czy potrzebujesz gotowego komponentu React/Tailwind?
   - Subtelny efekt marketingowy: Magic UI.
   - Eksperymentalny tekst, tło lub mikrointerakcja: React Bits.
   - Fundament design systemu: shadcn/ui, Radix Primitives albo Base UI.
   - Gotowe klasy i wiele motywów: daisyUI.
   - Sekcje marketingowe: HyperUI lub Kokonut UI.
   - Szerokie wyszukiwanie: 21st.dev, po weryfikacji licencji elementu.
4. Czy rezultat wymaga głębi, shaderów lub GPU?
   - Gotowy efekt: ThreeUI Community jako punkt wyjścia.
   - Własna scena React: React Three Fiber + Drei; Leva do strojenia.
   - Silnik niezależny od React: Three.js albo Babylon.js.
   - Upewnij się, że istnieje statyczny fallback i budżet wydajności.
5. Czy główną treścią są dane?
   - Tabela headless: TanStack Table.
   - Bardzo duży edytowalny grid: Glide Data Grid.
   - Wykres React: Recharts; pełna kontrola: visx; duże lub złożone dane: Apache ECharts.
6. Czy potrzebujesz gotowego assetu?
   - Ikony: wybierz jedną rodzinę spośród Tabler, Lucide, Heroicons lub Phosphor.
   - HDRI, tekstura albo model: zacznij od Poly Haven; dla innych kolekcji sprawdź licencję konkretnego pliku.

## Macierz

| Kryterium | Anime.js | ThreeUI | Magic UI | React Bits | 21st.dev |
|---|---:|---:|---:|---:|---:|
| Timeline i choreografia | 5 | 2 | 2 | 2 | zależnie od elementu |
| SVG i motion path | 5 | 2 | 1 | 2 | zależnie od elementu |
| Gotowe UI React | 1 | 3 | 5 | 5 | 5 |
| 3D/WebGL/shadery | 2 | 5 | 2 | 4 | 4 |
| Niski koszt integracji | 3 | 2 | 5 | 4 | 3 |
| Jednolita licencja | MIT | MIT + asset notices | MIT | MIT + Commons Clause | nie |
| Darmowa warstwa w tej bazie | tak | Community | tak | tak | tylko zweryfikowane elementy |

## Reguły kompozycji

- Jeden efekt poziomu `hero` na viewport.
- Maksymalnie jedna biblioteka wysokopoziomowych komponentów na ekran; druga może dostarczyć pojedynczy efekt.
- Animację funkcjonalną implementuj przed dekoracyjną.
- Zadbaj o stan początkowy bez JavaScript i bez WebGL.
- Dla efektów kursora zapewnij zachowanie dotykowe lub wyłącz je na touch.
- Dla scroll animation unikaj blokowania natywnego scrolla.
- Nie mieszaj kilku systemów komponentów bez warstwy wspólnych tokenów typografii, koloru, radiusu i spacingu.
- Dla danych wybieraj narzędzie na podstawie liczby elementów, dostępności i potrzeb interakcji, nie wyglądu demo.

Pełny katalog porównawczy znajduje się w [free-source-directory.md](free-source-directory.md), a zasady tabel i wykresów w [`../knowledge/data-visualization.md`](../knowledge/data-visualization.md).
