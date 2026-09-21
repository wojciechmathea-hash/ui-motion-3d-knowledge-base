"use client";

// Source: upstream/magicui/apps/www/registry/magicui/animated-list.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT

import React, { useEffect, useMemo, useState, type ComponentPropsWithoutRef } from "react";
import { AnimatePresence, motion, type MotionProps } from "motion/react";
import { cn } from "@/lib/utils";

function AnimatedListItem({ children }: { children: React.ReactNode }) {
  const animations: MotionProps = { initial: { scale: 0.96, opacity: 0 }, animate: { scale: 1, opacity: 1 }, exit: { scale: 0.96, opacity: 0 }, transition: { type: "spring", stiffness: 350, damping: 40 } };
  return <motion.div {...animations} layout className="mx-auto w-full">{children}</motion.div>;
}

export interface AnimatedListProps extends ComponentPropsWithoutRef<"div"> { children: React.ReactNode; delay?: number }

export const AnimatedList = React.memo(({ children, className, delay = 600, ...props }: AnimatedListProps) => {
  const [index, setIndex] = useState(0);
  const childrenArray = useMemo(() => React.Children.toArray(children), [children]);
  useEffect(() => {
    if (index >= childrenArray.length - 1) return;
    const timeout = setTimeout(() => setIndex((current) => current + 1), delay);
    return () => clearTimeout(timeout);
  }, [index, delay, childrenArray.length]);
  return <div className={cn("flex flex-col items-center gap-3", className)} {...props}><AnimatePresence>{childrenArray.slice(0, index + 1).reverse().map((item) => <AnimatedListItem key={(item as React.ReactElement).key}>{item}</AnimatedListItem>)}</AnimatePresence></div>;
});
AnimatedList.displayName = "AnimatedList";
