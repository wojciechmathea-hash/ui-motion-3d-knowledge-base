"use client";

// Source: upstream/magicui/apps/www/registry/magicui/number-ticker.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT

import { useEffect, useRef, type ComponentPropsWithoutRef } from "react";
import { useInView, useMotionValue, useSpring } from "motion/react";
import { cn } from "@/lib/utils";

interface NumberTickerProps extends ComponentPropsWithoutRef<"span"> { value: number; startValue?: number; delay?: number }

export function NumberTicker({ value, startValue = 0, delay = 0, className, ...props }: NumberTickerProps) {
  const ref = useRef<HTMLSpanElement>(null);
  const motionValue = useMotionValue(startValue);
  const springValue = useSpring(motionValue, { damping: 60, stiffness: 100 });
  const isInView = useInView(ref, { once: true });

  useEffect(() => {
    if (!isInView) return;
    const timer = setTimeout(() => motionValue.set(value), delay * 1000);
    return () => clearTimeout(timer);
  }, [motionValue, isInView, delay, value]);

  useEffect(() => springValue.on("change", (latest) => {
    if (ref.current) ref.current.textContent = Intl.NumberFormat("pl-PL").format(Math.round(latest));
  }), [springValue]);

  return <span ref={ref} className={cn("inline-block tabular-nums tracking-tighter text-black", className)} {...props}>{startValue}</span>;
}
