// Source: upstream/magicui/apps/www/registry/magicui/bento-grid.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT
import { type ComponentPropsWithoutRef, type ReactNode } from "react";
import { ArrowRightIcon } from "@radix-ui/react-icons";
import { cn } from "@/lib/utils";
import { Button } from "@/components/ui/button";

interface BentoGridProps extends ComponentPropsWithoutRef<"div"> { children: ReactNode; className?: string }
interface BentoCardProps extends ComponentPropsWithoutRef<"div"> { name: string; className: string; background: ReactNode; Icon: React.ElementType; description: string; href: string; cta: string }

const BentoGrid = ({ children, className, ...props }: BentoGridProps) => <div className={cn("grid w-full auto-rows-[22rem] grid-cols-3 gap-4", className)} {...props}>{children}</div>;

const BentoCard = ({ name, className, background, Icon, description, href, cta, ...props }: BentoCardProps) => (
  <div className={cn("group relative col-span-3 flex flex-col justify-between overflow-hidden rounded-xl bg-background [box-shadow:0_0_0_1px_rgba(0,0,0,.06),0_2px_4px_rgba(0,0,0,.05),0_12px_24px_rgba(0,0,0,.05)]", className)} {...props}>
    <div>{background}</div>
    <div className="p-5">
      <div className="pointer-events-none z-10 flex transform-gpu flex-col gap-1 transition-all duration-300 lg:group-hover:-translate-y-10">
        <Icon className="text-muted-foreground h-10 w-10 origin-left transform-gpu transition-all duration-300 ease-in-out group-hover:scale-75" />
        <h3 className="text-xl font-semibold text-neutral-800">{name}</h3>
        <p className="text-muted-foreground max-w-lg">{description}</p>
      </div>
      <div className="flex w-full translate-y-0 flex-row items-center group-hover:opacity-100 lg:hidden"><Button variant="link" asChild size="sm" className="p-0"><a href={href}>{cta}<ArrowRightIcon className="ms-2 h-4 w-4" /></a></Button></div>
    </div>
    <div className="pointer-events-none absolute bottom-0 hidden w-full translate-y-10 flex-row items-center p-5 opacity-0 transition-all duration-300 group-hover:translate-y-0 group-hover:opacity-100 lg:flex"><Button variant="link" asChild size="sm" className="pointer-events-auto p-0"><a href={href}>{cta}<ArrowRightIcon className="ms-2 h-4 w-4" /></a></Button></div>
    <div className="pointer-events-none absolute inset-0 transition-all duration-300 group-hover:bg-black/[.03]" />
  </div>
);

export { BentoCard, BentoGrid };
