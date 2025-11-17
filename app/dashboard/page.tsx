import { getBookings } from '@/lib/data/bookings';
import { getPartners } from '@/lib/data/partners';

export default async function DashboardPage() {
	const [{ data: bookings }, partners] = await Promise.all([
		getBookings({ limit: 10, sort: 'created_at.desc' }),
		getPartners()
	]);

	const counts = {
		total: bookings.length,
		new: bookings.filter((b) => b.status === 'new').length,
		confirmed: bookings.filter((b) => b.status === 'confirmed').length,
		cancelled: bookings.filter((b) => b.status === 'cancelled').length
	};

	return (
		<div className="space-y-6">
			<h1 className="text-2xl font-semibold">Dashboard</h1>
			<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
				<Card title="New" value={counts.new} />
				<Card title="Confirmed" value={counts.confirmed} />
				<Card title="Cancelled" value={counts.cancelled} />
				<Card title="Partners" value={partners.length} />
			</div>
			<div>
				<h2 className="text-lg font-medium mb-2">Recent Bookings</h2>
				<div className="overflow-x-auto card">
					<table className="table">
						<thead>
							<tr>
								<th className="text-left px-3 py-2">Name</th>
								<th className="text-left px-3 py-2">Email</th>
								<th className="text-left px-3 py-2">Type</th>
								<th className="text-left px-3 py-2">Date</th>
								<th className="text-left px-3 py-2">Time</th>
								<th className="text-left px-3 py-2">Status</th>
							</tr>
						</thead>
						<tbody>
							{bookings.map((b) => (
								<tr key={b.id}>
									<td className="px-3 py-2">{b.name}</td>
									<td className="px-3 py-2">{b.email}</td>
									<td className="px-3 py-2">{b.consultation_type}</td>
									<td className="px-3 py-2">{b.date}</td>
									<td className="px-3 py-2">{b.time}</td>
									<td className="px-3 py-2">{b.status}</td>
								</tr>
							))}
						</tbody>
					</table>
				</div>
			</div>
		</div>
	);
}

function Card({ title, value }: { title: string; value: number }) {
	return (
		<div className="card-padded">
			<div className="text-sm text-blue-700">{title}</div>
			<div className="text-2xl font-semibold">{value}</div>
		</div>
	);
}


