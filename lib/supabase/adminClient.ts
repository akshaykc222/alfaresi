import { createClient } from '@supabase/supabase-js';

export function getAdminSupabase() {
	const url = process.env.NEXT_PUBLIC_SUPABASE_URL!;
	const serviceRole = process.env.SUPABASE_SERVICE_ROLE;
	if (!serviceRole) {
		throw new Error('SUPABASE_SERVICE_ROLE missing');
	}
	return createClient(url, serviceRole, {
		auth: { persistSession: false, autoRefreshToken: false }
	});
}


