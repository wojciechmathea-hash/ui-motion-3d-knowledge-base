import { ArrowDown, ArrowRight, ShieldCheck } from "lucide-react";
import { BlurFade } from "@/components/magicui/blur-fade";
import { ScrollProgress } from "@/components/magicui/scroll-progress";
import { TextReveal } from "@/components/magicui/text-reveal";
import { Button } from "@/components/ui/button";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { CapabilityGrid, ComponentLab } from "@/components/showcase-demos";
import { SiteFooter } from "@/components/site-footer";
import { SiteHeader } from "@/components/site-header";

export default function Home() {
  return (
    <>
      <a href="#main" className="bg-primary text-primary-foreground sr-only focus:not-sr-only focus:fixed focus:top-3 focus:left-3 focus:z-[100] focus:rounded-lg focus:px-4 focus:py-2">Przejdź do treści</a>
      <ScrollProgress />
      <SiteHeader />
      <main id="main">
        <section id="start" className="scroll-mt-24">
          <div className="mx-auto flex min-h-[calc(100svh-4rem)] max-w-6xl flex-col items-start justify-center gap-8 px-5 py-20 text-left md:items-center md:px-8 md:text-center">
            <BlurFade><div className="border-border bg-muted inline-flex items-center gap-2 rounded-full border px-3 py-1.5 text-sm font-medium"><ShieldCheck className="size-4" aria-hidden="true" />100% elementów zarejestrowanych</div></BlurFade>
            <BlurFade delay={0.06}><h1 className="max-w-5xl text-5xl font-semibold tracking-[-0.05em] text-balance sm:text-7xl lg:text-8xl">Pełny pokaz bazy. Bez wizualnych domysłów AI.</h1></BlurFade>
            <BlurFade delay={0.12}><p className="text-muted-foreground max-w-2xl text-lg leading-8 text-balance">Jedna spójna rodzina komponentów, scroll tracking, interaktywne stany i jawne provenance. Każdy element tej strony wskazuje konkretny plik w lokalnym repozytorium.</p></BlurFade>
            <BlurFade delay={0.18} className="flex w-full flex-col gap-3 sm:w-auto sm:flex-row"><Button asChild size="lg"><a href="#story">Rozpocznij historię<ArrowDown aria-hidden="true" /></a></Button><Button asChild size="lg" variant="outline"><a href="#provenance">Zobacz manifest<ArrowRight aria-hidden="true" /></a></Button></BlurFade>
          </div>
        </section>

        <section id="story" className="scroll-mt-24 border-y border-border bg-muted/40">
          <TextReveal>Nie dokładamy efektów dla samego efektu. Najpierw wybieramy zweryfikowany wzorzec, przypisujemy mu źródło, wersję i licencję, a dopiero potem składamy z niego spójną stronę.</TextReveal>
        </section>

        <section id="capabilities" className="scroll-mt-24 py-24 md:py-32">
          <div className="mx-auto max-w-6xl px-5 md:px-8">
            <BlurFade inView><p className="text-muted-foreground text-sm font-semibold tracking-widest uppercase">Możliwości repozytorium</p><h2 className="mt-4 max-w-3xl text-4xl font-semibold tracking-[-0.04em] text-balance md:text-6xl">Interakcja w służbie treści, nie przypadkowej dekoracji.</h2><p className="text-muted-foreground mt-5 max-w-2xl text-lg leading-8">Cztery komponenty pokazują rzeczywiste dane, stany, wybór oraz nawigację. Każdy pochodzi z Magic UI Free.</p></BlurFade>
            <BlurFade inView delay={0.08} className="mt-12"><CapabilityGrid /></BlurFade>
          </div>
        </section>

        <section id="lab" className="scroll-mt-24 border-y border-border bg-muted/40 py-24 md:py-32">
          <div className="mx-auto max-w-5xl px-5 md:px-8">
            <BlurFade inView><p className="text-muted-foreground text-sm font-semibold tracking-widest uppercase">Laboratorium komponentów</p><h2 className="mt-4 text-4xl font-semibold tracking-[-0.04em] md:text-6xl">Wybierz warstwę systemu.</h2><p className="text-muted-foreground mt-5 max-w-2xl text-lg leading-8">Tabs zachowują stan, fokus klawiatury i kompletną treść każdego panelu.</p></BlurFade>
            <BlurFade inView delay={0.08} className="mt-10"><ComponentLab /></BlurFade>
          </div>
        </section>

        <section id="provenance" className="scroll-mt-24 py-24 md:py-32">
          <div className="mx-auto max-w-4xl px-5 md:px-8">
            <BlurFade inView><p className="text-muted-foreground text-sm font-semibold tracking-widest uppercase">Provenance</p><h2 className="mt-4 text-4xl font-semibold tracking-[-0.04em] md:text-6xl">Skąd dokładnie pochodzi strona?</h2></BlurFade>
            <BlurFade inView delay={0.08} className="mt-10">
              <Accordion type="single" collapsible defaultValue="visual">
                <AccordionItem value="visual"><AccordionTrigger>Jaki system odpowiada za warstwę wizualną?</AccordionTrigger><AccordionContent>Magic UI Free z lokalnego katalogu <code>upstream/magicui</code>, commit <code>d7207e5692d14c00dceafa8488d6d01f197fa0e4</code>, licencja MIT. Hero, sekcje, bento, scroll progress, text reveal, blur fade, number ticker, animated list, dock i CTA mają wskazane pliki źródłowe.</AccordionContent></AccordionItem>
                <AccordionItem value="dependencies"><AccordionTrigger>Jakie zależności uzupełniają główną rodzinę?</AccordionTrigger><AccordionContent>Radix Primitives zapewnia dostępne Tabs i Accordion, Lucide dostarcza ikony, Fontsource dostarcza Manrope, a Radix Colors udostępnia paletę zmapowaną na role semantyczne.</AccordionContent></AccordionItem>
                <AccordionItem value="forbidden"><AccordionTrigger>Czego celowo tutaj nie ma?</AccordionTrigger><AccordionContent>Nie ma WebGL, niezarejestrowanych kształtów, ozdobnych orbit, generowanych ad hoc ilustracji, assetów Pro ani komponentów z poprzednich projektów. Ruch nie przechwytuje natywnego scrolla.</AccordionContent></AccordionItem>
                <AccordionItem value="audit"><AccordionTrigger>Gdzie znajduje się pełna mapa elementów?</AccordionTrigger><AccordionContent>W pliku <code>projects/source-locked-showcase/SOURCE_LOCK_MANIFEST.md</code>. Manifest pokrywa wszystkie widoczne i interaktywne elementy oraz wskazuje rekordy provenance w katalogu projektu.</AccordionContent></AccordionItem>
              </Accordion>
            </BlurFade>
          </div>
        </section>

        <section id="finish" className="scroll-mt-24 border-y border-border bg-muted/40 py-20">
          <div className="mx-auto flex max-w-5xl flex-col items-center px-5 text-center md:px-8">
            <ShieldCheck className="bg-background size-24 rounded-[2rem] border border-border p-6 shadow-xl" aria-hidden="true" />
            <h2 className="mt-8 text-4xl font-semibold tracking-[-0.04em] md:text-6xl">Jedna baza. Jeden manifest. Zero przypadkowych elementów.</h2>
            <p className="text-muted-foreground mt-5 max-w-2xl text-lg leading-8">Strona pozostaje interaktywna, lecz każdy ruch i każdy komponent ma udokumentowane pochodzenie.</p>
            <Button asChild size="lg" className="mt-8"><a href="#start">Wróć na początek<ArrowRight aria-hidden="true" /></a></Button>
          </div>
        </section>
      </main>
      <SiteFooter />
    </>
  );
}
