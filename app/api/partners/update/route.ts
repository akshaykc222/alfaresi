import { NextRequest, NextResponse } from 'next/server';
import { getAdminSupabase } from '@/lib/supabase/adminClient';

export async function PATCH(req: NextRequest) {
	try {
		const { id, name, sub_title, image_url, position } = await req.json();
		if (!id) return NextResponse.json({ error: 'id required' }, { status: 400 });
		const admin = getAdminSupabase();
		const update: Record<string, any> = {};
		if (name !== undefined) update.name = name;
		if (sub_title !== undefined) update.sub_title = sub_title;
		if (image_url !== undefined) update.image_url = image_url;
		if (position !== undefined) update.position = position;
		const { error } = await admin.from('partners').update(update).eq('id', id);
		if (error) throw error;
		return NextResponse.json({ ok: true });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


