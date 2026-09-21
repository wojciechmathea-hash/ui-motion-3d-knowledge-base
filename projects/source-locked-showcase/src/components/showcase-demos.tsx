"use client";

import { BookOpen, Boxes, Check, Code2, Database, FileCheck2, Gauge, Layers3, MousePointer2, PanelTop, ScrollText, ShieldCheck } from "lucide-react";
import { AnimatedList } from "@/components/magicui/animated-list";
import { BentoCard, BentoGrid } from "@/components/magicui/bento-grid";
import { Dock, DockIcon } from "@/components/magicui/dock";
import { NumberTicker } from "@/components/magicui/number-ticker";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";

const sourceEvents = [
  { title: "Komponent zweryfikowany", meta: "Magic UI · MIT", Icon: Check },
  { title: "Licencja zapisana", meta: "pełny provenance", Icon: FileCheck2 },
  { title: "Reduced motion gotowy", meta: "WCAG 2.2 AA", Icon: Gauge },
  { title: "Build zakończony", meta: "statyczny eksport", Icon: Code2 },
];

function SourceEvent({ title, meta, Icon }: (typeof sourceEvents)[number]) {
  return (
    <figure className="bg-background relative mx-auto w-full max-w-sm rounded-2xl border border-border p-4 shadow-sm transition-all duration-200 ease-in-out hover:scale-[1.02]">
      <div className="flex items-center gap-3">
        <div className="bg-accent text-accent-foreground flex size-10 items-center justify-center rounded-xl"><Icon className="size-5" aria-hidden="true" /></div>
        <figcaption><div className="text-sm font-medium">{title}</div><div className="text-muted-foreground text-xs">{meta}</div></figcaption>
      </div>
    </figure>
  );
}

function MetricBoard() {
  return (
    <div className="absolute inset-x-5 top-8 grid grid-cols-2 gap-3">
      {[{ value: 42, label: "źródła" }, { value: 44, label: "generatory" }, { value: 37, label: "repo edukacyjne" }, { value: 249, label: "pozycji Magic UI" }].map((metric) => (
        <div key={metric.label} className="bg-muted rounded-xl border border-border p-4">
          <NumberTicker value={metric.value} className="text-3xl font-semibold" />
          <p className="text-muted-foreground mt-1 text-xs">{metric.label}</p>
        </div>
      ))}
    </div>
  );
}

function SourceList() {
  return <AnimatedList className="absolute inset-x-4 top-5">{sourceEvents.map((item) => <SourceEvent key={item.title} {...item} />)}</AnimatedList>;
}

function TabsPreview() {
  return (
    <Tabs defaultValue="ui" className="absolute inset-x-5 top-8">
      <TabsList className="grid w-full grid-cols-3"><TabsTrigger value="ui">UI</TabsTrigger><TabsTrigger value="motion">Motion</TabsTrigger><TabsTrigger value="data">Dane</TabsTrigger></TabsList>
      <TabsContent value="ui" className="bg-muted mt-3 rounded-xl border border-border p-5"><PanelTop className="mb-4 size-7" /><p className="font-medium">Komponenty produktu</p><p className="text-muted-foreground mt-1 text-sm">Nawigacja, karty, formularze i sekcje marketingowe.</p></TabsContent>
      <TabsContent value="motion" className="bg-muted mt-3 rounded-xl border border-border p-5"><MousePointer2 className="mb-4 size-7" /><p className="font-medium">Subtelny feedback</p><p className="text-muted-foreground mt-1 text-sm">Ruch odpowiada na scroll, fokus i wybór użytkownika.</p></TabsContent>
      <TabsContent value="data" className="bg-muted mt-3 rounded-xl border border-border p-5"><Database className="mb-4 size-7" /><p className="font-medium">Czytelne dane</p><p className="text-muted-foreground mt-1 text-sm">Tabele, metryki i wizualizacje ze źródłem.</p></TabsContent>
    </Tabs>
  );
}

function DockPreview() {
  const links = [{ href: "#start", label: "Start", Icon: PanelTop }, { href: "#story", label: "Zasada", Icon: ScrollText }, { href: "#capabilities", label: "Możliwości", Icon: Boxes }, { href: "#provenance", label: "Źródła", Icon: BookOpen }];
  return <div className="absolute inset-x-0 top-20 flex justify-center"><Dock>{links.map(({ href, label, Icon }) => <DockIcon key={href}><a href={href} aria-label={label} title={label} className="hover:bg-accent focus-visible:ring-ring flex size-10 items-center justify-center rounded-full focus-visible:ring-2 focus-visible:outline-none"><Icon className="size-5" aria-hidden="true" /></a></DockIcon>)}</Dock></div>;
}

export function CapabilityGrid() {
  const features = [
    { Icon: Gauge, name: "Baza, którą można policzyć", description: "Aktualne liczby są pobrane z wygenerowanego podsumowania repozytorium.", href: "#provenance", cta: "Zobacz źródła", className: "lg:col-span-2", background: <MetricBoard /> },
    { Icon: ShieldCheck, name: "Kontrolowany przepływ", description: "Każdy krok pokazuje jawny stan zamiast dekoracyjnej animacji.", href: "#provenance", cta: "Sprawdź reguły", className: "lg:col-span-1", background: <SourceList /> },
    { Icon: Layers3, name: "Komponenty ze stanem", description: "Tabs demonstrują wybór, fokus i trzy kompletne warianty treści.", href: "#lab", cta: "Otwórz laboratorium", className: "lg:col-span-2", background: <TabsPreview /> },
    { Icon: MousePointer2, name: "Nawigator sekcji", description: "Dock prowadzi do prawdziwych rozdziałów strony i reaguje na wskaźnik.", href: "#story", cta: "Przejdź do historii", className: "lg:col-span-1", background: <DockPreview /> },
  ];
  return <BentoGrid>{features.map((feature) => <BentoCard key={feature.name} {...feature} />)}</BentoGrid>;
}

const panels = {
  components: { icon: Boxes, title: "Komponenty", description: "Bento, tabs, accordion, dock, przyciski i nawigacja pochodzą z jednej rodziny Magic UI oraz jej zależności Radix.", items: ["stany hover, focus i active", "obsługa klawiatury", "responsywny układ"] },
  motion: { icon: MousePointer2, title: "Motion", description: "Scroll progress, Text Reveal, Blur Fade, Number Ticker i Animated List wykorzystują Motion bez przejmowania natywnego scrolla.", items: ["scroll tracking", "reduced motion", "ruch powiązany ze stanem"] },
  system: { icon: ShieldCheck, title: "System źródeł", description: "Każdy element ma registry ID, plik upstream, wersję, licencję oraz dozwolony zakres adaptacji.", items: ["100% pokrycia manifestu", "tylko darmowe źródła", "brak warstwy WebGL"] },
};

export function ComponentLab() {
  return (
    <Tabs defaultValue="components" className="w-full">
      <TabsList className="grid h-auto w-full grid-cols-3"><TabsTrigger value="components" className="py-3">Komponenty</TabsTrigger><TabsTrigger value="motion" className="py-3">Motion</TabsTrigger><TabsTrigger value="system" className="py-3">Źródła</TabsTrigger></TabsList>
      {Object.entries(panels).map(([value, panel]) => <TabsContent key={value} value={value} className="mt-4 rounded-2xl border border-border p-6 md:p-10"><panel.icon className="text-muted-foreground size-8" aria-hidden="true" /><h3 className="mt-6 text-2xl font-semibold tracking-tight">{panel.title}</h3><p className="text-muted-foreground mt-3 max-w-2xl leading-7">{panel.description}</p><ul className="mt-8 grid gap-3 md:grid-cols-3">{panel.items.map((item) => <li key={item} className="bg-muted flex items-center gap-2 rounded-xl p-4 text-sm font-medium"><Check className="size-4" aria-hidden="true" />{item}</li>)}</ul></TabsContent>)}
    </Tabs>
  );
}
