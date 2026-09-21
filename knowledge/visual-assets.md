# Darmowe assety wizualne

## Hierarchia preferencji

1. Asset własny lub wygenerowany dla projektu z zapisanym provenance.
2. CC0, gdy nie jest potrzebna atrybucja — np. zweryfikowany asset z Poly Haven.
3. MIT/ISC dla ikon i kodu, z zachowaniem informacji licencyjnej.
4. CC-BY tylko wtedy, gdy projekt ma trwałe miejsce na poprawną atrybucję.
5. Kolekcja z licencjami mieszanymi wyłącznie po kontroli konkretnego pliku.

## Modele, tekstury i HDRI

- Zapisz URL strony assetu, autora, nazwę pliku, wersję, licencję i datę pobrania.
- Sprawdź osobno model, tekstury, animacje, fonty i dźwięk dołączone do paczki.
- Optymalizuj kopię roboczą: kompresja tekstur, rozsądna liczba polygonów, meshopt/Draco tylko gdy koszt dekodowania jest uzasadniony.
- Przygotuj statyczny fallback oraz limit DPR dla scen 3D.
- Nie zakładaj, że asset użyty w demo biblioteki kodu ma tę samą licencję co sama biblioteka.

## Ikony

W jednym produkcie preferuj jedną rodzinę ikon. Ustal wspólną grubość linii, optyczny rozmiar, sposób wyrównania i etykiety dostępności. Ikona dekoracyjna powinna być ukryta przed czytnikiem ekranu; ikona akcji wymaga dostępnej nazwy.

## Czego nie importować

- materiałów oznaczonych Pro, Premium lub wymagających zakupu,
- assetów bez jawnej licencji,
- podglądów, screenshotów, miniaturek i brandingu serwisów,
- modeli z ograniczeniem noncommercial do projektu komercyjnego,
- całych bibliotek assetów, gdy potrzebny jest jeden plik.
