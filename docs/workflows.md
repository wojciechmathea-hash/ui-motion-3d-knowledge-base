# Workflow pracy z bazą

## 1. Wyszukiwanie

1. Określ kategorię z `docs/taxonomy.md`.
2. Sprawdź `catalog/generated-summary.json` i odpowiedni submoduł.
3. Jeśli nie ma dopasowania, użyj oficjalnego narzędzia 21st.dev z `upstream/21st-skill`.
4. Nie pobieraj elementu, dopóki nie zweryfikujesz jego licencji.

## 2. Ocena kandydata

- dopasowanie do celu użytkownika;
- koszt zależności i rozmiar bundle;
- działanie bez hover oraz na touch;
- reduced motion;
- koszt GPU i stabilność FPS;
- jakość fallbacku;
- możliwość tokenizacji kolorów, typografii i spacingu;
- licencja kodu oraz osobno assetów.

## 3. Import

Skopiuj `templates/component-record.json`, uzupełnij dane i dopiero wtedy dodaj implementację do projektu docelowego. Nie twórz lokalnego „mega bundle” komponentów.

## 4. Adaptacja

- Zamień kolory, fonty, promienie i spacing na tokeny produktu.
- Usuń branding, teksty przykładowe i zewnętrzne trackery.
- Ogranicz motion do jednej czytelnej intencji.
- Dodaj test klawiatury, reduced motion i małego viewportu.
- Dla 3D ustaw limit DPR i pauzę poza viewportem.

## 5. Aktualizacja upstreamów

Uruchom `pwsh ./tools/update-upstreams.ps1`, przejrzyj `git diff --submodule=log`, sprawdź licencje, a następnie zatwierdź nowe wskaźniki commitów.

