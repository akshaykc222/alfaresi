import { NextRequest, NextResponse } from 'next/server';
import { createServerClient } from '@supabase/ssr';

const PUBLIC_PATHS = ['/login', '/_next', '/favicon.ico', '/api/public'];

export async function middleware(req: NextRequest) {
	const { pathname } = req.nextUrl;
	const isPublic = PUBLIC_PATHS.some((p) => pathname.startsWith(p));
	const res = NextResponse.next({
		request: {
			headers: req.headers
		}
	});

	const supabase = createServerClient(
		process.env.NEXT_PUBLIC_SUPABASE_URL!,
		process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!,
		{
			cookies: {
				get(name: string) {
					return req.cookies.get(name)?.value;
				},
				set(name: string, value: string, options: any) {
					res.cookies.set({ name, value, ...options });
				},
				remove(name: string, options: any) {
					res.cookies.set({ name, value: '', ...options });
				}
			}
		}
	);

	const { data } = await supabase.auth.getUser();
	const isLoggedIn = !!data.user;

	if (!isLoggedIn && !isPublic) {
		const loginUrl = new URL('/login', req.url);
		loginUrl.searchParams.set('redirect', req.nextUrl.pathname);
		return NextResponse.redirect(loginUrl);
	}

	if (isLoggedIn && pathname === '/login') {
		return NextResponse.redirect(new URL('/dashboard', req.url));
	}

	return res;
}

export const config = {
	matcher: ['/((?!_next/static|_next/image|favicon.ico|api/public).*)']
};


