import { getServerSupabase } from '@/lib/supabase/serverClient';
import { Booking } from '@/lib/supabase/types';

export type GetBookingsParams = {
	status?: string;
	q?: string;
	from?: string;
	to?: string;
	limit?: number;
	offset?: number;
	sort?: 'created_at.desc' | 'created_at.asc';
};

export async function getBookings(params: GetBookingsParams = {}) {
	const supabase = await getServerSupabase();
	let query = supabase.from('bookings').select('*', { count: 'exact' });

	if (params.status) query = query.eq('status', params.status);
	if (params.q) {
		const q = params.q;
		query = query.or(
			`name.ilike.%${q}%,email.ilike.%${q}%,phone.ilike.%${q}%`
		);
	}
	if (params.from) query = query.gte('created_at', params.from);
	if (params.to) query = query.lte('created_at', params.to);

	const sort = params.sort ?? 'created_at.desc';
	const [column, direction] = sort.split('.') as ['created_at', 'asc' | 'desc'];
	query = query.order(column, { ascending: direction === 'asc' });

	if (params.limit != null) {
		const from = params.offset ?? 0;
		const to = from + params.limit - 1;
		query = query.range(from, to);
	}

	const { data, error, count } = await query.returns<Booking[]>();
	if (error) throw error;
	return { data, count: count ?? 0 };
}

export async function updateBookingStatus(id: string, status: string) {
	const supabase = await getServerSupabase();
	const { error } = await supabase.from('bookings').update({ status }).eq('id', id);
	if (error) throw error;
}

export async function deleteBooking(id: string) {
	const supabase = await getServerSupabase();
	const { error } = await supabase.from('bookings').delete().eq('id', id);
	if (error) throw error;
}

export async function invokeBookingEmail(booking: Booking) {
	const supabase = await getServerSupabase();
	const { error } = await supabase.functions.invoke('send-booking-email', {
		body: {
			to: 'Info@alfaresi.co',
			subject: 'Booking Update',
			data: booking
		}
	});
	if (error) throw error;
}


