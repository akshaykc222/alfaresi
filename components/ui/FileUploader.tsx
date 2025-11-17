'use client';
import React, { useRef, useState } from 'react';

export function FileUploader({
	onUploaded
}: {
	onUploaded: (url: string) => void;
}) {
	const inputRef = useRef<HTMLInputElement | null>(null);
	const [loading, setLoading] = useState(false);
	const [error, setError] = useState<string | null>(null);
	const [fileName, setFileName] = useState<string>('');

	async function onChange(e: React.ChangeEvent<HTMLInputElement>) {
		const file = e.target.files?.[0];
		if (!file) return;
		if (!['image/png', 'image/jpeg'].includes(file.type)) {
			setError('PNG/JPG only');
			return;
		}
		if (file.size > 2 * 1024 * 1024) {
			setError('Max size 2MB');
			return;
		}
		setFileName(file.name);
		setError(null);
		setLoading(true);
		try {
			const form = new FormData();
			form.set('file', file);
			const res = await fetch('/api/upload/partner-image', {
				method: 'POST',
				body: form
			});
			const json = await res.json();
			if (!res.ok) throw new Error(json.error || 'Upload failed');
			onUploaded(json.url);
		} catch (err: any) {
			setError(err.message ?? 'Upload failed');
		} finally {
			setLoading(false);
			// reset the input value so user can re-select the same file if needed
			if (inputRef.current) inputRef.current.value = '';
		}
	}

	return (
		<div className="space-y-1">
			<input
				ref={inputRef}
				type="file"
				accept="image/png,image/jpeg"
				onChange={onChange}
				disabled={loading}
				className="hidden"
			/>
			<button
				type="button"
				className="inline-flex items-center rounded-md bg-blue-600 hover:bg-blue-700 text-white px-3 py-2 text-sm disabled:opacity-50"
				onClick={() => inputRef.current?.click()}
				disabled={loading}
			>
				{loading ? 'Uploading…' : 'Choose Image'}
			</button>
			{fileName ? <div className="text-xs text-blue-700">{fileName}</div> : null}
			{error ? <div className="text-sm text-red-600">{error}</div> : null}
			<div className="text-xs text-blue-700">PNG/JPG, max 2MB</div>
		</div>
	);
}


