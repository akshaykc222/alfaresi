import type { Metadata } from "next";
import Link from "next/link";
import { Toaster } from "sonner";
import { Geist, Geist_Mono } from "next/font/google";
import "./globals.css";

const geistSans = Geist({
  variable: "--font-geist-sans",
  subsets: ["latin"],
});

const geistMono = Geist_Mono({
  variable: "--font-geist-mono",
  subsets: ["latin"],
});

export const metadata: Metadata = {
  title: "Alfaresi Admin",
  description: "Admin panel for Alfaresi",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="en">
      <body
        className={`${geistSans.variable} ${geistMono.variable} antialiased text-blue-800 bg-white`}
      >
        <Toaster richColors />
        <div className="min-h-dvh grid grid-cols-[240px_1fr] bg-white">
          <aside className="hidden md:block border-r border-blue-100 bg-blue-50">
            <div className="h-14 flex items-center px-4 font-semibold text-blue-800">
              Alfaresi Admin
            </div>
            <nav className="px-2 py-2 space-y-1">
              <NavItem href="/dashboard" label="Dashboard" />
              <NavItem href="/bookings" label="Bookings" />
              <NavItem href="/partners" label="Partners" />
              <NavItem href="/settings" label="Settings" />
            </nav>
          </aside>
          <main className="min-h-dvh">
            <div className="h-14 sticky top-0 z-10 bg-white/80 backdrop-blur border-b border-blue-100 flex items-center px-4">
              <div className="text-sm text-blue-700">Admin Panel</div>
            </div>
            <div className="p-4 sm:p-6">
              {children}
            </div>
          </main>
        </div>
      </body>
    </html>
  );
}

function NavItem({ href, label }: { href: string; label: string }) {
  return (
    <Link
      href={href}
      className="block rounded-md px-3 py-2 text-sm text-blue-900 hover:bg-blue-100"
    >
      {label}
    </Link>
  );
}
