# Przewodnik wyboru

## Drzewo decyzji

1. Czy efekt ma przekazać zmianę stanu lub poprowadzić uwagę?
   - Tak: zacznij od CSS/Motion albo Anime.js.
   - Nie: sprawdź, czy dekoracja nie pogarsza czytelności i wydajności.
2. Czy potrzebujesz sekwencji, scrubowania, SVG albo wielu targetów?
   - Tak: Anime.js.
3. Czy potrzebujesz gotowego komponentu React/Tailwind?
   - Subtelny efekt marketingowy: Magic UI.
   - Eksperymentalny tekst, tło lub mikrointerakcja: React Bits.
   - Szerokie wyszukiwanie: 21st.dev, po weryfikacji licencji elementu.
4. Czy rezultat wymaga głębi, shaderów lub GPU?
   - Tak: ThreeUI Community jako punkt wyjścia.
   - Upewnij się, że istnieje statyczny fallback i budżet wydajności.

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

