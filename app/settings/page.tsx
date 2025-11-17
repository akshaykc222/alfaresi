import { getServerSupabase } from '@/lib/supabase/serverClient';

export default async function SettingsPage() {
	const supabase = await getServerSupabase();
	const url = process.env.NEXT_PUBLIC_SUPABASE_URL;
	const anon = process.env.NEXT_PUBLIC_SUPABASE_ANON_KEY ? 'present' : 'missing';
	const bucket = process.env.NEXT_PUBLIC_SUPABASE_STORAGE_BUCKET || 'projects';

	// bucket check
	const { data: buckets, error: bucketErr } = await supabase.storage.listBuckets();
	const bucketOk = !bucketErr && (buckets ?? []).some((b) => b.name === bucket);

	// function check
	const { error: fnErr } = await supabase.functions.invoke('send-booking-email', {
		body: { to: 'test@example.com', subject: 'Health Check (ignore)', data: { ok: true } }
	});
	const fnOk = !fnErr;

	return (
		<div className="p-6 space-y-4">
			<h1 className="text-2xl font-semibold">Settings</h1>
			<ul className="space-y-2">
				<li className="flex items-center gap-2">
					<span className="font-medium w-64">Supabase URL</span>
					<span className="text-sm">{url}</span>
				</li>
				<li className="flex items-center gap-2">
					<span className="font-medium w-64">Anon Key</span>
					<span className="text-sm">{anon}</span>
				</li>
				<li className="flex items-center gap-2">
					<span className="font-medium w-64">Bucket reachable</span>
					<span className={`text-sm ${bucketOk ? 'text-green-600' : 'text-red-600'}`}>
						{bucketOk ? 'ok' : 'failed'}
					</span>
				</li>
				<li className="flex items-center gap-2">
					<span className="font-medium w-64">Edge Function invoke</span>
					<span className={`text-sm ${fnOk ? 'text-green-600' : 'text-red-600'}`}>
						{fnOk ? 'ok' : 'failed'}
					</span>
				</li>
			</ul>
		</div>
	);
}


