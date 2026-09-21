// Layout source: upstream/magicui/apps/www/components/site-header.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT
import { ArrowUpRight, Code2 } from "lucide-react";
import { Button } from "@/components/ui/button";

const nav = [
  { href: "#story", label: "Zasada" },
  { href: "#capabilities", label: "Możliwości" },
  { href: "#lab", label: "Komponenty" },
  { href: "#provenance", label: "Źródła" },
];

export function SiteHeader() {
  return (
    <header className="bg-background/90 sticky top-0 z-50 w-full border-b border-border backdrop-blur-md">
      <div className="mx-auto flex h-16 max-w-6xl items-center gap-4 px-5 md:px-8">
        <a href="#start" className="focus-visible:ring-ring flex items-center gap-2 rounded-md font-semibold tracking-tight focus-visible:ring-2 focus-visible:outline-none">
          <span className="bg-primary text-primary-foreground grid size-8 place-items-center rounded-lg text-xs">SL</span>
          <span>Source Locked</span>
        </a>
        <nav aria-label="Główna nawigacja" className="ml-auto hidden items-center gap-1 md:flex">
          {nav.map((item) => <Button key={item.href} asChild variant="ghost" size="sm"><a href={item.href}>{item.label}</a></Button>)}
        </nav>
        <Button asChild variant="outline" size="sm" className="ml-auto md:ml-2">
          <a href="https://github.com/wojciechmathea-hash/ui-motion-3d-knowledge-base" target="_blank" rel="noreferrer"><Code2 aria-hidden="true" />Repozytorium<ArrowUpRight aria-hidden="true" /></a>
        </Button>
      </div>
    </header>
  );
}
