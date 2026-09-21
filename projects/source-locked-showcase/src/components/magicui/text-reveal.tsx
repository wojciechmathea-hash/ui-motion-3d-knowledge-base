"use client";

// Source: upstream/magicui/apps/www/registry/magicui/text-reveal.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT

import { useRef, type ComponentPropsWithoutRef, type FC, type ReactNode } from "react";
import { motion, type MotionValue, useReducedMotion, useScroll, useTransform } from "motion/react";
import { cn } from "@/lib/utils";

export interface TextRevealProps extends ComponentPropsWithoutRef<"div"> { children: string }

export const TextReveal: FC<TextRevealProps> = ({ children, className }) => {
  const sectionRef = useRef<HTMLDivElement | null>(null);
  const { scrollYProgress } = useScroll({ target: sectionRef });
  const reduceMotion = useReducedMotion();
  const words = children.split(" ");

  if (reduceMotion) {
    return <div className={cn("mx-auto max-w-4xl px-6 py-24 text-3xl font-bold tracking-tight md:text-5xl", className)}>{children}</div>;
  }

  return (
    <div ref={sectionRef} className={cn("relative z-0 h-[200vh]", className)}>
      <div className="sticky top-0 mx-auto flex h-[50%] max-w-5xl items-center bg-transparent px-4 py-20">
        <span className="flex flex-wrap p-5 text-2xl font-bold tracking-tight text-black/20 md:p-8 md:text-4xl lg:p-10 lg:text-5xl">
          {words.map((word, i) => <Word key={`${word}-${i}`} progress={scrollYProgress} range={[i / words.length, (i + 1) / words.length]}>{word}</Word>)}
        </span>
      </div>
    </div>
  );
};

function Word({ children, progress, range }: { children: ReactNode; progress: MotionValue<number>; range: [number, number] }) {
  const opacity = useTransform(progress, range, [0, 1]);
  return <span className="relative mx-1 lg:mx-1.5"><span className="absolute opacity-30">{children}</span><motion.span style={{ opacity }} className="text-black">{children}</motion.span></span>;
}
