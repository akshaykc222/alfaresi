import { getBookings } from '@/lib/data/bookings';

export default async function BookingsPage({
	searchParams
}: {
	searchParams: Promise<{ status?: string; q?: string; page?: string }>;
}) {
	const sp = await searchParams;
	const page = Number(sp.page ?? 1);
	const limit = 10;
	const offset = (page - 1) * limit;
	const { data, count } = await getBookings({
		status: sp.status,
		q: sp.q,
		limit,
		offset,
		sort: 'created_at.desc'
	});
	const totalPages = Math.max(1, Math.ceil((count ?? 0) / limit));
	return (
		<div className="space-y-4">
			<h1 className="text-2xl font-semibold">Bookings</h1>
			<div className="flex gap-2">
				{/* Placeholder for Filters/Search - to be enhanced */}
				<input
					name="q"
					placeholder="Search name/email/phone"
					className="input w-72"
				/>
			</div>
			<div className="overflow-x-auto card">
				<table className="table">
					<thead>
						<tr>
							{['name','email','phone','consultation_type','date','time','status','created_at'].map((h)=>(
								<th key={h} className="capitalize">{h.replace('_',' ')}</th>
							))}
						</tr>
					</thead>
					<tbody>
						{data.map((b) => (
							<tr key={b.id}>
								<td>{b.name}</td>
								<td>{b.email}</td>
								<td>{b.phone}</td>
								<td>{b.consultation_type}</td>
								<td>{b.date}</td>
								<td>{b.time}</td>
								<td>{b.status}</td>
								<td>{new Date(b.created_at).toLocaleString()}</td>
							</tr>
						))}
					</tbody>
				</table>
			</div>
			<div className="flex items-center gap-2">
				<span className="text-sm text-gray-600">
					Page {page} of {totalPages}
				</span>
			</div>
		</div>
	);
}


