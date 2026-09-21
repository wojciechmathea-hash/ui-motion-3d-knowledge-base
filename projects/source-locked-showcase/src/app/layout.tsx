import type { Metadata } from "next";
import "./globals.css";
import { MotionProvider } from "@/components/motion-provider";

export const metadata: Metadata = {
  title: "Source Locked — pokaz możliwości bazy UI",
  description: "Interaktywny pokaz komponentów z prywatnej, source-locked bazy UI.",
};

export default function RootLayout({ children }: LayoutProps<"/">) {
  return (
    <html lang="pl" className="h-full antialiased">
      <body className="min-h-full"><MotionProvider>{children}</MotionProvider></body>
    </html>
  );
}
