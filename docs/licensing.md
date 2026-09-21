# Polityka licencji i dostępu

## Ustalenia właściciela

- Repozytorium jest prywatne i przeznaczone dla jednej osoby.
- Nie służy do redystrybucji komponentów ani assetów.
- Używane są wyłącznie darmowe zasoby.
- Elementy Pro, płatne, gated i wymagające zakupu są poza zakresem.

Prywatność repozytorium nie unieważnia warunków źródłowych. Dlatego każdy plik zachowuje pochodzenie, a zasoby bez jawnej licencji pozostają tylko linkami.

## Klasy włączenia

| Klasa | Znaczenie | Działanie |
|---|---|---|
| `full-open-upstream` | Publiczne repo z jednoznaczną licencją open source | Dozwolony submoduł i użycie zgodne z licencją |
| `free-explicitly-licensed-assets-only` | Serwis łączy darmowe i płatne treści | Włącz tylko konkretny darmowy asset z jawną licencją |
| `official-tool-and-verified-items-only` | Katalog ma różne licencje i oficjalne API/CLI | Używaj narzędzia; kontroluj każdy element osobno |
| `upstream-reference-for-private-product-use` | Kod jest dostępny, ale nie wolno go dystrybuować jako bibliotekę | Używaj wyłącznie wewnątrz produktu końcowego |
| `reference-only` | Licencja nieznana lub kopiowanie zabronione | Zachowaj wyłącznie URL i własne notatki |

## Lista kontrolna przed importem

1. Czy asset jest darmowy bez okresu próbnego i bez zakupu?
2. Czy istnieje jawna licencja obejmująca kod oraz osobno media, fonty i modele 3D?
3. Czy autor i źródłowy URL są znane?
4. Czy warunki dopuszczają użycie w planowanym produkcie?
5. Czy plik nie jest demo/preview należącym do platformy?
6. Czy rekord provenance zawiera commit albo wersję?

Jeśli na którekolwiek z pytań 1–3 odpowiedź brzmi „nie”, nie kopiuj pliku. Dodaj jedynie rekord `reference-only`.

## Źródła z ograniczeniami

### Magic UI Pro

Witryna pozostaje w katalogu, ponieważ była źródłem wejściowym i opisuje przydatną taksonomię sekcji. Do repo trafiają jednak tylko publiczne, darmowe repozytoria Magic UI z jawną licencją. Obecnie jest to m.in. MIT-licensed `magicuidesign/portfolio`. Płatne template’y i sekcje Pro są blokowane.

### 21st.dev

Serwis nie ma jednej licencji dla całego katalogu. Nie wolno tworzyć bulk mirroru ani automatycznie zbierać prezentacji marketplace’u. Oficjalne narzędzie jest podpięte jako submoduł; konkretny komponent może zostać użyty dopiero po weryfikacji jego autora i licencji.

### React Bits

Komponenty mogą działać w prywatnej lub komercyjnej aplikacji końcowej, ale nie mogą zostać sprzedane, sublicencjonowane ani redystrybuowane jako komponenty, bundle lub port. Ten projekt nie buduje z nich publicznej paczki.

