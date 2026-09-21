# Instrukcje dla agentów

`CREATION_STANDARD.md` jest jedyną nadrzędną instrukcją tworzenia w tym repozytorium. Przeczytaj go w całości przed przygotowaniem treści, strony, prezentacji, UI, komponentu, animacji, wizualizacji albo doświadczenia 3D.

Bezpośrednie wymagania użytkownika mają pierwszeństwo. Pozostałe pliki repozytorium są katalogami, danymi, checklistami lub materiałami pomocniczymi i nie ustanawiają konkurencyjnych zasad.

## Nawigacja po danych

- `catalog/source-registry.json` — zatwierdzone źródła komponentów i assetów;
- `catalog/generator-registry.json` — narzędzia i generatory, z wyraźnym rozdzieleniem lokalnego open source od SaaS;
- `catalog/font-source-registry.json` — zatwierdzone katalogi fontów open source;
- `catalog/scrollytelling-inspiration-registry.json` — inspiracje `reference-only`, nigdy źródła kodu lub assetów;
- `catalog/learning-repository-registry.json` — repozytoria edukacyjne;
- `docs/` i `knowledge/` — wyjaśnienia pomocnicze;
- `templates/component-record.json` — wymagany zapis provenance;
- `templates/web-quality-checklist.md` — checklista wykonawcza dla witryn.

Po zmianie rejestrów uruchom `pwsh ./tools/build-catalog.ps1`, a przed zakończeniem `pwsh ./tools/validate.ps1`.
