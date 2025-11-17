import { cookies } from 'next/headers';
import { createServerClient } from '@supabase/ssr';

export async function getServerSupabase() {
	const cookieStore = await cookies();
	const supabaseUrl = process.env.NEXT_PUBLIC_SUPABASE_URL!;
	const supabaseAnonKey = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY!;

	return createServerClient(supabaseUrl, supabaseAnonKey, {
		cookies: {
			get(name: string) {
				return cookieStore.get(name)?.value;
			},
			set(name: string, value: string, options: any) {
				try {
					// In RSC render, setting cookies may not be allowed; ignore errors
					cookieStore.set(name, value, options);
				} catch {
					// no-op in edge where set is not allowed during render
				}
			},
			remove(name: string, options: any) {
				try {
					cookieStore.set(name, '', { ...options, maxAge: 0 });
				} catch {
					// no-op
				}
			}
		}
	});
}


