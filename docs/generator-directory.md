# Rejestr darmowych generatorów

Stan weryfikacji: 2026-09-21. Rejestr rozdziela narzędzia lokalne i open source od usług chmurowych z bezpłatnym limitem. „Darmowy plan” oznacza wyłącznie możliwość użycia bez opłaty w opisanym zakresie — nie oznacza automatycznie prywatności, braku watermarku ani bezwarunkowych praw do wyniku.

Źródłem maszynowym jest `catalog/generator-registry.json`.

## UI, komponenty i kod

| Generator | Zastosowanie | Darmowa warstwa | Najważniejsze ograniczenie |
|---|---|---|---|
| [Penpot](https://github.com/penpot/penpot) | UI, prototypy, design systems | MPL-2.0, self-hosted | Assety i template’y społeczności mają osobne licencje |
| [GrapesJS](https://github.com/GrapesJS/grapesjs) | Visual builder stron i e-maili | BSD-3-Clause core | Studio SDK jest osobnym produktem komercyjnym |
| [Puck](https://github.com/puckeditor/puck) | Visual editor React | MIT | Pluginy i dostawcy AI osobno |
| [Craft.js](https://github.com/prevwong/craft.js) | Własny page builder React | MIT | Framework, nie kompletny edytor |
| [OpenUI](https://github.com/wandb/openui) | Prompt-to-UI i komponenty | Apache-2.0 aplikacji | Model/API może być płatny; wynik wymaga audytu |
| [Onlook](https://github.com/onlook-dev/onlook) | Wizualna edycja React w kodzie | Apache-2.0 repozytorium | Hosted successor ma osobne warunki |
| [screenshot-to-code](https://github.com/abi/screenshot-to-code) | Screenshot/mockup/video do kodu | MIT aplikacji | Model może kosztować; wolno przetwarzać tylko autoryzowane materiały |

## Diagramy, wireframe’y i grafiki kodu

| Generator | Zastosowanie | Licencja | Uwaga |
|---|---|---|---|
| [Excalidraw](https://github.com/excalidraw/excalidraw) | Wireframe, whiteboard, diagram | MIT | Biblioteki kształtów i obrazy osobno |
| [Mermaid](https://github.com/mermaid-js/mermaid) | Diagram-as-code | MIT | Zewnętrzne icon packi osobno |
| [draw.io](https://github.com/jgraph/drawio) | Diagramy i architektura | Apache-2.0 kodu | Stencile, ikony i znaki towarowe mają dodatkowe zasady |
| [Carbon](https://github.com/carbon-app/carbon) | PNG/SVG z kodu źródłowego | MIT | Nie umieszczać sekretów w screenshotach |

## Wzory, tła, SVG, tekstury i 3D

| Generator | Zastosowanie | Licencja/warunki | Tryb |
|---|---|---|---|
| [css-doodle](https://github.com/css-doodle/css-doodle) | Generative art, patterny, obrazy i wideo | MIT | lokalny |
| [Tabbied](https://github.com/tabbied-design/tabbied) | Generator wzorów i PNG | MIT | lokalny/web |
| [Material Maker](https://github.com/RodZill4/material-maker) | Proceduralne materiały PBR | MIT | lokalny |
| [Blender](https://github.com/blender/blender) | Modelowanie, render, animacja, compositing i video | GPL-3.0-or-later dla kodu | lokalny; output nie staje się automatycznie GPL |
| [TripoSR](https://github.com/VAST-AI-Research/TripoSR) | Image-to-3D | MIT repozytorium | kontrola checkpointu i obrazu wejściowego |
| [Haikei](https://haikei.app) | Fale, bloby, gradienty i SVG | bezpłatne bez konta; Terms of Service | zachować snapshot warunków dla ważnego assetu |
| [BGJar](https://bgjar.com) | Tła SVG i patterny | CC-BY-4.0 w planie Free | wymaga atrybucji; zakaz samodzielnej redystrybucji assetu |

## Lokalne generowanie AI

| Generator/model | Zastosowanie | Licencja | Bramka użycia |
|---|---|---|---|
| [ComfyUI](https://github.com/Comfy-Org/ComfyUI) | Workflow obrazów i filmów | GPL-3.0 aplikacji | każdy model, LoRA i custom node osobno |
| [InvokeAI](https://github.com/invoke-ai/InvokeAI) | Obrazy, canvas, in/outpainting | Apache-2.0 aplikacji | każdy model osobno; API-only może kosztować |
| [Stable Diffusion WebUI](https://github.com/AUTOMATIC1111/stable-diffusion-webui) | Obrazy i rozszerzenia | AGPL-3.0 aplikacji | modele i rozszerzenia osobno |
| [Stability AI Core Models](https://stability.ai/core-models) | Obraz, wideo, 3D i audio | Community License | próg komercyjny USD 1M przychodu organizacji |
| [Wan2.1](https://github.com/Wan-Video/Wan2.1) | Text/image-to-video i edycja | Apache-2.0 deklarowane przez projekt | wysoki koszt GPU; sprawdzić konkretny checkpoint |
| [LTX-Video](https://github.com/Lightricks/LTX-Video) | Text/image-to-video | Apache-2.0 tej linii repozytorium | nowsze LTX i gated weights mogą mieć inne warunki |

## Programowe i klasyczne wideo

| Narzędzie | Zastosowanie | Licencja | Uwaga |
|---|---|---|---|
| [Manim Community](https://github.com/ManimCommunity/manim) | Animacje matematyczne i edukacyjne | MIT | media, LaTeX i fonty osobno |
| [Motion Canvas](https://github.com/motion-canvas/motion-canvas) | Motion graphics w TypeScript | MIT | audio, fonty i media osobno |
| [FFmpeg](https://ffmpeg.org) | Transkodowanie, compositing i automatyzacja | LGPL-2.1+ lub GPL zależnie od buildu | sprawdzić dokładny binary i kodeki |
| [Kdenlive](https://github.com/KDE/kdenlive) | Nieliniowa edycja wideo | GPL-3.0-or-later | template’y i stock media osobno |

## Usługi z bezpłatnym limitem

| Usługa | Generuje | Bezpłatny zakres zweryfikowany 2026-09-21 | Ryzyko |
|---|---|---|---|
| [v0](https://v0.dev/pricing) | UI, komponenty, aplikacje | 5 USD kredytów/miesiąc, limit 7 wiadomości/dzień | limity dynamiczne; audyt kodu i zależności |
| [Bolt](https://bolt.new/pricing) | Strony i aplikacje | 300K tokenów/dzień, 1M/miesiąc | branding Bolt; płatna edycja obrazów wyłączona |
| [Lovable](https://lovable.dev/pricing) | Strony i aplikacje | dzienne kredyty budowy z limitem miesięcznym | zmienny system kredytów i chmury |
| [Adobe Firefly](https://www.adobe.com/products/firefly/plans.html) | Obrazy, wektory, video, audio | ograniczone generacje dzienne | modele partnerskie i free-user terms osobno |
| [Ideogram](https://ideogram.ai/pricing/) | Grafiki i typografia | cotygodniowe slow credits | wyniki Free są publiczne |
| [Leonardo.Ai](https://www.leonardo.ai/pricing) | Obrazy, wideo i post-processing | codzienny limit tokenów | limit i widoczność są dynamiczne |
| [Pika](https://pika.art/pricing) | Wideo i efekty | plan Free | sprawdzić aktualny watermark i prawa komercyjne |
| [Runway](https://help.runwayml.com/hc/en-us/articles/50404627334547-Free-plan-details) | Wideo, obraz i audio | jednorazowo 125 kredytów | brak odnowienia; watermark |
| [Canva Free](https://www.canva.com/pricing/) | Grafiki, layouty, obrazy i wideo | wspólny limit do ok. 20 użyć AI zależnie od narzędzia | generator może wstawić element Pro; trzeba go usunąć lub zastąpić |
| [Microsoft Designer](https://designer.microsoft.com) | Grafiki social i obrazy AI | bezpłatny dostęp konsumencki z dynamicznym limitem | chmura i warunki dostawców modeli |

## Zasada akceptacji wyniku

Wynik może trafić do projektu dopiero po zapisaniu: nazwy narzędzia i modelu, daty, planu, promptu lub parametrów, źródeł wejściowych, informacji o publiczności wyniku, watermarku, praw do outputu oraz licencji każdego wykorzystanego assetu. Dla SaaS warunki należy sprawdzić ponownie w dniu generowania.
