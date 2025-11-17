import { NextRequest, NextResponse } from 'next/server';
import { uploadPartnerImage } from '@/lib/data/partners';

export async function POST(req: NextRequest) {
	try {
		const form = await req.formData();
		const file = form.get('file') as File | null;
		if (!file) {
			return NextResponse.json({ error: 'file required' }, { status: 400 });
		}
		if (!['image/png', 'image/jpeg'].includes(file.type)) {
			return NextResponse.json({ error: 'PNG/JPG only' }, { status: 400 });
		}
		if (file.size > 2 * 1024 * 1024) {
			return NextResponse.json({ error: 'Max size 2MB' }, { status: 400 });
		}
		const arrayBuffer = await file.arrayBuffer();
		const url = await uploadPartnerImage({
			file: Buffer.from(arrayBuffer),
			filename: file.name,
			contentType: file.type
		});
		return NextResponse.json({ url });
	} catch (err: any) {
		return NextResponse.json({ error: err.message ?? 'error' }, { status: 500 });
	}
}


