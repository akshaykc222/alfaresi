import { NextRequest, NextResponse } from 'next/server';
import { getAdminSupabase } from '@/lib/supabase/adminClient';

export async function DELETE(req: NextRequest) {
	try {
		const { id } = await req.json();
		if (!id) return NextResponse.json({ error: 'id required' }, { status: 400 });
		const admin = getAdminSupabase();
		const { error } = await admin.from('bookings').delete().eq('id', id);
		if (error) throw error;
		return NextResponse.json({ ok: true });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


