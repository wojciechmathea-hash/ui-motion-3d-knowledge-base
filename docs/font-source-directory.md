# Katalogi czcionek open source

Stan weryfikacji: 2026-09-21. Do finalnych projektów wybieramy wyłącznie fonty z jednoznaczną licencją open source. Sam fakt, że font jest darmowy, nie wystarcza.

| Katalog | Sposób użycia | Najlepsze zastosowanie |
|---|---|---|
| [Google Fonts](https://fonts.google.com/) | pobranie i preferowane self-hosting; licencja per rodzina | szeroki wybór, języki, variable fonts |
| [Fontsource](https://fontsource.org/) | wersjonowane paczki npm i self-hosting | integracja z aplikacjami, subsety |
| [Bunny Fonts](https://fonts.bunny.net/) | prywatnościowy hosted API lub pobranie | hostowanie bez logowania danych użytkownika |
| [Velvetyne](https://velvetyne.fr/) | pobranie z licencją konkretnej rodziny | eksperymentalny display i editorial |
| [Collletttivo](https://www.collletttivo.it/) | pobranie wraz z OFL i kredytem autora | wyraziste systemy wizualne |
| [The League of Moveable Type](https://www.theleagueofmoveabletype.com/) | font i źródła na licencji open font | klasyczna typografia webowa i nauka |
| [Open Foundry](https://open-foundry.com/) | discovery; pobranie z oryginalnej strony autora | kuratorskie szukanie alternatyw |
| [Use & Modify](https://usemodify.com/) | discovery po stylu i licencji | współczesne i eksperymentalne kroje |
| [Omnibus-Type](https://www.omnibus-type.com/) | tylko rodziny z jawną licencją open source | editorial, variable i wielojęzyczność |

Pełne bramki licencyjne znajdują się w `catalog/font-source-registry.json`.

## Szybki dobór

- Tekst interfejsu: Inter, Source Sans 3, IBM Plex Sans lub Atkinson Hyperlegible.
- Długi tekst i editorial: Source Serif 4, Literata, Lora lub Newsreader.
- Nagłówki: Fraunces, Space Grotesk, Archivo lub League Spartan.
- Kod i dane: IBM Plex Mono, JetBrains Mono lub Source Code Pro.

To przykłady, nie automatyczne zatwierdzenie. Dla każdej wybranej rodziny sprawdź licencję, autora, polskie znaki, używane wagi i konkretną wersję.

## Minimalna praktyka produkcyjna

1. Zacznij od jednej rodziny i systemowego fallbacku.
2. Pobierz tylko potrzebne warianty i subsety w WOFF2.
3. Self-hostuj, jeśli projekt nie wymaga zewnętrznego CDN.
4. Ustaw metrycznie zbliżony fallback, aby ograniczyć CLS.
5. Testuj `ą ć ę ł ń ó ś ź ż`, kursywę, cyfry tabelaryczne i tekst przy 200% zoom.
6. Zachowaj plik licencji obok fontów oraz dodaj wpis provenance.
