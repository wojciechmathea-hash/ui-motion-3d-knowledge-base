import React from 'react';
import { createRoot } from 'react-dom/client';
import Galaxy from './Galaxy.jsx';

const host = document.getElementById('cosmos');

if (host) {
  const reducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
  createRoot(host).render(
    <Galaxy
      aria-hidden="true"
      focal={[0.5, 0.46]}
      rotation={[1, 0]}
      starSpeed={0.34}
      density={1.12}
      hueShift={18}
      disableAnimation={reducedMotion}
      speed={0.42}
      mouseInteraction={!reducedMotion}
      glowIntensity={0.28}
      saturation={0.18}
      mouseRepulsion={!reducedMotion}
      repulsionStrength={1.35}
      twinkleIntensity={0.16}
      rotationSpeed={0.018}
      transparent={false}
    />
  );
}

