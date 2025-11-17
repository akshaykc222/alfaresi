import { NextRequest } from 'next/server';
import { getAdminSupabase } from '@/lib/supabase/adminClient';

export async function POST(req: NextRequest) {
	const { status, q, from, to } = await req.json();
	const supabase = getAdminSupabase();
	let query = supabase.from('bookings').select('*');
	if (status) query = query.eq('status', status);
	if (q) query = query.or(`name.ilike.%${q}%,email.ilike.%${q}%,phone.ilike.%${q}%`);
	if (from) query = query.gte('created_at', from);
	if (to) query = query.lte('created_at', to);
	const { data, error } = await query.order('created_at', { ascending: false });
	if (error) {
		return new Response(JSON.stringify({ error: error.message }), { status: 500 });
	}
	const header = [
		'id','name','email','phone','consultation_type','date','time','status','created_at'
	];
	const rows = (data ?? []).map((b: any) =>
		header.map((h) => (b[h] ?? '')).join(',')
	);
	const csv = [header.join(','), ...rows].join('\n');
	return new Response(csv, {
		status: 200,
		headers: {
			'Content-Type': 'text/csv; charset=utf-8',
			'Content-Disposition': 'attachment; filename=\"bookings.csv\"'
		}
	});
}


