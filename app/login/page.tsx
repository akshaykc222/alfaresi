'use client';

import { useState, Suspense } from 'react';
import { useRouter, useSearchParams } from 'next/navigation';
import { getBrowserSupabase } from '@/lib/supabase/browserClient';
import { Toaster, toast } from 'sonner';

function LoginForm() {
	const router = useRouter();
	const searchParams = useSearchParams();
	const [email, setEmail] = useState('');
	const [password, setPassword] = useState('');
	const [loading, setLoading] = useState(false);

	async function onSubmit(e: React.FormEvent) {
		e.preventDefault();
		setLoading(true);
		try {
			const supabase = getBrowserSupabase();
			const { error } = await supabase.auth.signInWithPassword({ email, password });
			if (error) throw error;
			toast.success('Signed in');
			const redirect = searchParams.get('redirect') || '/dashboard';
			router.replace(redirect);
		} catch (err: any) {
			toast.error(err.message ?? 'Sign in failed');
		} finally {
			setLoading(false);
		}
	}

	return (
		<div className="w-full max-w-sm bg-white p-6 rounded-lg shadow">
			<h1 className="text-xl font-semibold mb-4">Admin Sign in</h1>
			<form onSubmit={onSubmit} className="space-y-3">
				<div>
					<label className="block text-sm font-medium mb-1">Email</label>
					<input
						type="email"
						required
						className="w-full rounded-md border border-gray-300 px-3 py-2 outline-none focus:ring-2 focus:ring-black/10"
						value={email}
						onChange={(e) => setEmail(e.target.value)}
					/>
				</div>
				<div>
					<label className="block text-sm font-medium mb-1">Password</label>
					<input
						type="password"
						required
						className="w-full rounded-md border border-gray-300 px-3 py-2 outline-none focus:ring-2 focus:ring-black/10"
						value={password}
						onChange={(e) => setPassword(e.target.value)}
					/>
				</div>
				<button
					type="submit"
					disabled={loading}
					className="w-full inline-flex items-center justify-center rounded-md bg-blue-600 hover:bg-blue-700 text-white px-4 py-2 disabled:opacity-50"
				>
					{loading ? 'Signing in…' : 'Sign in'}
				</button>
			</form>
		</div>
	);
}

export default function LoginPage() {
	return (
		<div className="min-h-dvh flex items-center justify-center bg-gray-50">
			<Toaster richColors />
			<Suspense fallback={<div className="w-full max-w-sm bg-white p-6 rounded-lg shadow">Loading...</div>}>
				<LoginForm />
			</Suspense>
		</div>
	);
}


