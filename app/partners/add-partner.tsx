'use client';
import { useState } from 'react';
import { useRouter } from 'next/navigation';
import { Modal } from '@/components/ui/Modal';
import { FileUploader } from '@/components/ui/FileUploader';

export default function AddPartnerButton() {
	const [open, setOpen] = useState(false);
	const [name, setName] = useState('');
	const [subTitle, setSubTitle] = useState('');
	const [imageUrl, setImageUrl] = useState('');
	const [saving, setSaving] = useState(false);
	const router = useRouter();

	async function onSave() {
		if (!name) return;
		setSaving(true);
		try {
			const res = await fetch('/api/partners/create', {
				method: 'POST',
				headers: { 'Content-Type': 'application/json' },
				body: JSON.stringify({ name, sub_title: subTitle, image_url: imageUrl })
			});
			const json = await res.json();
			if (!res.ok) throw new Error(json.error || 'Failed to create partner');
			setOpen(false);
			setName(''); setSubTitle(''); setImageUrl('');
			router.refresh();
		} catch (e) {
			alert((e as Error).message);
		} finally {
			setSaving(false);
		}
	}

	return (
		<>
			<button
				className="inline-flex items-center rounded-md bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 text-sm"
				onClick={() => setOpen(true)}
			>
				Add Partner
			</button>
			<Modal
				open={open}
				onClose={() => setOpen(false)}
				title="Add Partner"
				footer={
					<div className="flex justify-end gap-2">
						<button className="px-3 py-2 rounded-md border" onClick={() => setOpen(false)}>Cancel</button>
						<button
							className="px-3 py-2 rounded-md bg-blue-600 hover:bg-blue-700 text-white disabled:opacity-50"
							disabled={saving || !name}
							onClick={onSave}
						>
							{saving ? 'Saving…' : 'Save'}
						</button>
					</div>
				}
			>
				<div className="space-y-3">
					<div>
						<label className="block text-sm font-medium mb-1">Name</label>
						<input className="w-full border rounded-md px-3 py-2" value={name} onChange={(e)=>setName(e.target.value)} />
					</div>
					<div>
						<label className="block text-sm font-medium mb-1">Sub title</label>
						<input className="w-full border rounded-md px-3 py-2" value={subTitle} onChange={(e)=>setSubTitle(e.target.value)} />
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


