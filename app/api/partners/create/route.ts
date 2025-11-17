import { NextRequest, NextResponse } from 'next/server';
import { getAdminSupabase } from '@/lib/supabase/adminClient';

export async function POST(req: NextRequest) {
	try {
		const { name, sub_title, image_url, position } = await req.json();
		if (!name) return NextResponse.json({ error: 'name required' }, { status: 400 });
		const admin = getAdminSupabase();
		const { error } = await admin.from('partners').insert({
			name,
			sub_title: sub_title ?? '',
			image_url: image_url ?? '',
			position: typeof position === 'number' ? position : 0
		});
		if (error) throw error;
		return NextResponse.json({ ok: true });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


