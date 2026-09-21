"use client";

// Source: upstream/magicui/apps/www/registry/magicui/dock.tsx @ d7207e5692d14c00dceafa8488d6d01f197fa0e4 | License: MIT

import React, { useRef } from "react";
import { cva, type VariantProps } from "class-variance-authority";
import { motion, type MotionProps, type MotionValue, useMotionValue, useSpring, useTransform } from "motion/react";
import { cn } from "@/lib/utils";

const dockVariants = cva("supports-backdrop-blur:bg-white/80 mx-auto flex h-[58px] w-max items-center justify-center gap-2 rounded-2xl border border-border p-2 shadow-sm backdrop-blur-md");

export interface DockProps extends VariantProps<typeof dockVariants> { className?: string; iconSize?: number; iconMagnification?: number; iconDistance?: number; children: React.ReactNode }

const Dock = React.forwardRef<HTMLDivElement, DockProps>(({ className, children, iconSize = 40, iconMagnification = 58, iconDistance = 140, ...props }, ref) => {
  const mouseX = useMotionValue(Infinity);
  return <motion.div ref={ref} onMouseMove={(event) => mouseX.set(event.pageX)} onMouseLeave={() => mouseX.set(Infinity)} {...props} className={cn(dockVariants({ className }))}>{React.Children.map(children, (child) => React.isValidElement<DockIconProps>(child) && child.type === DockIcon ? React.cloneElement(child, { ...child.props, mouseX, size: iconSize, magnification: iconMagnification, distance: iconDistance }) : child)}</motion.div>;
});
Dock.displayName = "Dock";

export interface DockIconProps extends Omit<MotionProps & React.HTMLAttributes<HTMLDivElement>, "children"> { size?: number; magnification?: number; distance?: number; mouseX?: MotionValue<number>; children?: React.ReactNode }

const DockIcon = ({ size = 40, magnification = 58, distance = 140, mouseX, className, children, ...props }: DockIconProps) => {
  const ref = useRef<HTMLDivElement>(null);
  const fallback = useMotionValue(Infinity);
  const distanceCalc = useTransform(mouseX ?? fallback, (value) => { const bounds = ref.current?.getBoundingClientRect() ?? { x: 0, width: 0 }; return value - bounds.x - bounds.width / 2; });
  const sizeTransform = useTransform(distanceCalc, [-distance, 0, distance], [size, magnification, size]);
  const scaleSize = useSpring(sizeTransform, { mass: 0.1, stiffness: 150, damping: 12 });
  return <motion.div ref={ref} style={{ width: scaleSize, height: scaleSize, padding: Math.max(6, size * 0.2) }} className={cn("flex aspect-square items-center justify-center rounded-full", className)} {...props}><div>{children}</div></motion.div>;
};
DockIcon.displayName = "DockIcon";

export { Dock, DockIcon };
