# Source-lock manifest — Source Locked Showcase

## Główna rodzina wizualna

| Pole | Wartość |
|---|---|
| Registry ID | `magicui-net` |
| Nazwa systemu / biblioteki | Magic UI Free |
| Dokładny upstream path | `upstream/magicui/apps/www` |
| URL | https://magicui.design/docs |
| Commit / wersja | `d7207e5692d14c00dceafa8488d6d01f197fa0e4` |
| Licencja | MIT |
| Użyte tokeny / motyw źródłowy | neutralny motyw marketingowy Magic UI, role semantyczne oparte na Radix Colors |

## Mapa elementów

| Obszar / selektor | Element lub komponent | Registry ID | Upstream: dokładny plik / eksport | URL | Commit / wersja | Licencja | Dozwolona adaptacja | Provenance record |
|---|---|---|---|---|---|---|---|---|
| dokument | tokeny, reset, typografia bazowa | `magicui-net`, `radix-colors`, `fontsource` | `apps/www/styles/globals.css`, `@radix-ui/colors`, `@fontsource-variable/manrope` | https://magicui.design / https://www.radix-ui.com/colors / https://fontsource.org/fonts/manrope | Magic UI commit `d7207e...`; Radix `3.0.0`; Manrope `5.3.0` | MIT, MIT, OFL-1.1 | mapowanie na role semantyczne i polskie znaki | `provenance/magicui-components.json`, `provenance/radix-colors.json`, `provenance/fontsource-manrope.json` |
| `header` | sticky SiteHeader, nawigacja, CTA | `magicui-net` | `apps/www/components/site-header.tsx`, `components/ui/button.tsx` | https://magicui.design | `d7207e...` | MIT | treść, prawdziwe kotwice, ograniczenie funkcji | `provenance/magicui-components.json` |
| pasek górny | ScrollProgress | `magicui-net` | `apps/www/registry/magicui/scroll-progress.tsx` | https://magicui.design/docs/components/scroll-progress | `d7207e...` | MIT | wysokość i pozycja bez zmiany zachowania | `provenance/magicui-components.json` |
| `#start` | układ Hero | `magicui-net` | `apps/www/components/sections/hero.tsx` | https://magicui.design | `d7207e...` | MIT | prawdziwa treść, CTA i etykiety | `provenance/magicui-components.json` |
| `#story` | TextReveal | `magicui-net` | `apps/www/registry/magicui/text-reveal.tsx` | https://magicui.design/docs/components/text-reveal | `d7207e...` | MIT | polska treść, reduced motion | `provenance/magicui-components.json` |
| `#capabilities` | układ sekcji ComponentDemos | `magicui-net` | `apps/www/components/sections/component-demos.tsx` | https://magicui.design | `d7207e...` | MIT | treść i osadzone zatwierdzone dema | `provenance/magicui-components.json` |
| siatka możliwości | BentoGrid, BentoCard | `magicui-net` | `apps/www/registry/magicui/bento-grid.tsx`, `registry/example/bento-demo.tsx` | https://magicui.design/docs/components/bento-grid | `d7207e...` | MIT | treść, ikony, prawdziwe kotwice | `provenance/magicui-components.json` |
| karta metryk | NumberTicker | `magicui-net` | `apps/www/registry/magicui/number-ticker.tsx`, `registry/example/number-ticker-demo.tsx` | https://magicui.design/docs/components/number-ticker | `d7207e...` | MIT | wartości wynikające z repozytorium | `provenance/magicui-components.json` |
| karta stanów | AnimatedList | `magicui-net` | `apps/www/registry/magicui/animated-list.tsx`, `registry/example/animated-list-demo.tsx` | https://magicui.design/docs/components/animated-list | `d7207e...` | MIT | treść listy i jednokrotny przebieg | `provenance/magicui-components.json` |
| wejścia sekcji | BlurFade | `magicui-net` | `apps/www/registry/magicui/blur-fade.tsx` | https://magicui.design/docs/components/blur-fade | `d7207e...` | MIT | krótszy ruch i reduced motion | `provenance/magicui-components.json` |
| `#lab` | Tabs | `magicui-net`, `radix-primitives` | `apps/www/components/ui/tabs.tsx`, `@radix-ui/react-tabs` | https://www.radix-ui.com/primitives/docs/components/tabs | Magic UI `d7207e...`; package `1.1.21` | MIT | treść paneli, fokus, responsywność | `provenance/radix-primitives.json` |
| nawigator rozdziałów | Dock, DockIcon | `magicui-net` | `apps/www/registry/magicui/dock.tsx`, `registry/example/dock-demo.tsx` | https://magicui.design/docs/components/dock | `d7207e...` | MIT | kotwice sekcji, dostępne etykiety | `provenance/magicui-components.json` |
| `#provenance` | Accordion | `magicui-net`, `radix-primitives` | `apps/www/components/ui/accordion.tsx`, `@radix-ui/react-accordion` | https://www.radix-ui.com/primitives/docs/components/accordion | Magic UI `d7207e...`; package `1.2.20` | MIT | treść pytań i odpowiedzi | `provenance/radix-primitives.json` |
| ikony interfejsu | Lucide icons | `lucide` | eksporty `lucide-react` | https://lucide.dev | package `1.47.0` | ISC | dobór semantyczny, rozmiar i etykieta | `provenance/lucide-icons.json` |
| `#finish` | CTASection | `magicui-net` | `apps/www/components/sections/cta.tsx` | https://magicui.design | `d7207e...` | MIT | treść i działająca kotwica | `provenance/magicui-components.json` |
| `footer` | SiteFooter | `magicui-net` | `apps/www/components/site-footer.tsx` | https://magicui.design | `d7207e...` | MIT | informacje projektu i prawdziwe linki | `provenance/magicui-components.json` |

## Niewizualny kod integracyjny

| Plik | Zakres techniczny | Dlaczego nie tworzy nowego elementu wizualnego |
|---|---|---|
| `src/app/page.tsx` | składa zatwierdzone sekcje i przekazuje treść | układ każdej sekcji wskazuje plik Magic UI w mapie powyżej |
| `src/components/showcase-demos.tsx` | przekazuje dane do Bento, Tabs, Dock i AnimatedList | nie tworzy nowego prymitywu; wykorzystuje publiczne API komponentów źródłowych |
| `src/lib/utils.ts` | łączenie klas Tailwind | kopia funkcji `cn` z Magic UI |

## Kontrola przed implementacją

- [x] 100% elementów widocznych i interaktywnych ma rekord źródłowy.
- [x] Nie ma źródeł wyłącznie referencyjnych.
- [x] Nie ma autorskich dekoracji, figur, teł, ikon, ilustracji, ruchu ani układów agenta.
- [x] Nie są używane assety generowane.
- [x] Magic UI Free jest jedną główną rodziną komponentów.
- [x] Radix, Lucide, Fontsource i Radix Colors pełnią wyłącznie role zależności przewidzianych przez rodzinę główną.
- [x] Adaptacja obejmuje treść, tokeny, responsywność, dostępność, reduced motion i integrację.

## Kontrola po implementacji

- [x] Audyt DOM i CSS nie wykazał elementów spoza manifestu.
- [x] Fallbacki są natywną treścią HTML lub zachowaniem komponentu źródłowego.
- [x] Projekt nie korzysta z wcześniejszych realizacji jako źródła.
- [x] Rekordy provenance i licencje są obecne w projekcie.
