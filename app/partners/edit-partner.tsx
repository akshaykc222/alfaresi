'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Modal } from '@/components/ui/Modal';
import { FileUploader } from '@/components/ui/FileUploader';
import { Partner } from '@/lib/supabase/types';

export default function EditPartnerButton({ partner }: { partner: Partner }) {
	const [open, setOpen] = useState(false);
	const [name, setName] = useState(partner.name);
	const [subTitle, setSubTitle] = useState(partner.sub_title);
	const [imageUrl, setImageUrl] = useState(partner.image_url);
	const [saving, setSaving] = useState(false);
	const router = useRouter();

	async function onSave() {
		setSaving(true);
		try {
			const res = await fetch('/api/partners/update', {
				method: 'PATCH',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ id: partner.id, name, sub_title: subTitle, image_url: imageUrl })
			});
			const json = await res.json();
			if (!res.ok) throw new Error(json.error || 'Failed to update partner');
			setOpen(false);
			router.refresh();
		} catch (e) {
			alert((e as Error).message);
		} finally {
			setSaving(false);
		}
	}

	return (
		<>
			<button className="btn-outline" onClick={() => setOpen(true)}>Edit</button>
			<Modal
				open={open}
				onClose={() => setOpen(false)}
				title="Edit Partner"
				footer={
					<div className="flex justify-end gap-2">
						<button className="btn-outline" onClick={() => setOpen(false)}>Cancel</button>
						<button className="btn-primary disabled:opacity-50" onClick={onSave} disabled={saving || !name}>
							{saving ? 'Saving…' : 'Save'}
						</button>
					</div>
				}
			>
				<div className="space-y-3">
					<div>
						<label className="block text-sm font-medium mb-1">Name</label>
						<input className="input" value={name} onChange={(e)=>setName(e.target.value)} />
					</div>
					<div>
						<label className="block text-sm font-medium mb-1">Sub title</label>
						<input className="input" value={subTitle} onChange={(e)=>setSubTitle(e.target.value)} />
					</div>
					<div>
						<label className="block text-sm font-medium mb-1">Image</label>
						<FileUploader onUploaded={(url)=>setImageUrl(url)} />
						{imageUrl ? <div className="text-xs mt-1 break-all">{imageUrl}</div> : null}
					</div>
				</div>
			</Modal>
		</>
	);
}


