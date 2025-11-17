import { getServerSupabase } from '@/lib/supabase/serverClient';
import { getAdminSupabase } from '@/lib/supabase/adminClient';
import { Partner } from '@/lib/supabase/types';

export async function getPartners() {
	const supabase = await getServerSupabase();
	const { data, error } = await supabase
		.from('partners')
		.select('*')
		.order('position', { ascending: true })
		.returns<Partner[]>();
	if (error) throw error;
	return data;
}

export type PartnerInput = {
	name: string;
	sub_title: string;
	image_url: string;
	position?: number;
};

export async function createPartner(p: PartnerInput) {
	const admin = getAdminSupabase();
	const { error } = await admin.from('partners').insert({
		...p,
		position: p.position ?? 0
	});
	if (error) throw error;
}

export async function updatePartner(id: string, p: PartnerInput) {
	const admin = getAdminSupabase();
	const { error } = await admin.from('partners').update(p).eq('id', id);
	if (error) throw error;
}

export async function deletePartner(id: string) {
	const admin = getAdminSupabase();
	const { error } = await admin.from('partners').delete().eq('id', id);
	if (error) throw error;
}

export async function reorderPartners(items: { id: string; position: number }[]) {
	const admin = getAdminSupabase();
	const updates = items.map((it) =>
		admin.from('partners').update({ position: it.position }).eq('id', it.id)
	);
	const results = await Promise.all(updates);
	const anyError = results.find((r) => r.error);
	if (anyError?.error) throw anyError.error;
}

export async function uploadPartnerImage(params: {
	file: Buffer;
	filename: string;
	contentType: string;
}) {
	const admin = getAdminSupabase();
	const bucket = process.env.NEXT_PUBLIC_SUPABASE_STORAGE_BUCKET || 'projects';
	const path = `${Date.now()}-${params.filename}`;
	const { error } = await admin.storage
		.from(bucket)
		.upload(path, params.file, {
			contentType: params.contentType,
			upsert: false
		});
	if (error) throw error;
	const { data } = admin.storage.from(bucket).getPublicUrl(path);
	return data.publicUrl;
}


