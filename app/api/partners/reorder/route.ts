import { NextRequest, NextResponse } from 'next/server';
import { reorderPartners } from '@/lib/data/partners';

export async function POST(req: NextRequest) {
	try {
		const items = await req.json();
		if (!Array.isArray(items)) {
			return NextResponse.json({ error: 'array required' }, { status: 400 });
		}
		await reorderPartners(items);
		return NextResponse.json({ ok: true });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


