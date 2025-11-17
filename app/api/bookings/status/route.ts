import { NextRequest, NextResponse } from 'next/server';
import { getAdminSupabase } from '@/lib/supabase/adminClient';

export async function PATCH(req: NextRequest) {
	try {
		const { id, status } = await req.json();
		if (!id || !status) {
			return NextResponse.json({ error: 'id and status required' }, { status: 400 });
		}
		const admin = getAdminSupabase();
		const { error } = await admin.from('bookings').update({ status }).eq('id', id);
		if (error) throw error;
		return NextResponse.json({ ok: true });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


