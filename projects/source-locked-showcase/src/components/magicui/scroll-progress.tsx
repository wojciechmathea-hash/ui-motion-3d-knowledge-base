"use client";

// Source: upstream/magicui/apps/www/registry/magicui/scroll-progress.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT

import { motion, useScroll, type MotionProps } from "motion/react";
import { cn } from "@/lib/utils";

type ScrollProgressProps = Omit<React.HTMLAttributes<HTMLElement>, keyof MotionProps>;

export function ScrollProgress({ className, ...props }: ScrollProgressProps) {
  const { scrollYProgress } = useScroll();
  return (
    <motion.div
      aria-hidden="true"
      className={cn("fixed inset-x-0 top-0 z-[70] h-1 origin-left bg-linear-to-r from-blue-9 via-blue-10 to-blue-11", className)}
      style={{ scaleX: scrollYProgress }}
      {...props}
    />
  );
}
