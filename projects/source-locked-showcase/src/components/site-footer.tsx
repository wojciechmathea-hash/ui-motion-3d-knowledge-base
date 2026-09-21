// Layout source: upstream/magicui/apps/www/components/site-footer.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT
export function SiteFooter() {
  return (
    <footer className="border-t border-border">
      <div className="text-muted-foreground mx-auto flex min-h-24 max-w-6xl flex-col items-center justify-between gap-3 px-5 py-6 text-center text-sm sm:flex-row sm:text-left md:px-8">
        <p>Source Locked Showcase · prywatny demonstrator bazy UI.</p>
        <div className="flex gap-5"><a className="hover:text-foreground underline-offset-4 hover:underline" href="#start">Początek</a><a className="hover:text-foreground underline-offset-4 hover:underline" href="#provenance">Provenance</a></div>
      </div>
    </footer>
  );
}
