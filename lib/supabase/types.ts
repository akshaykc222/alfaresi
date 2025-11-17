export type Booking = {
	id: string;
	name: string;
	email: string;
	phone: string;
	consultation_type: string;
	date: string;
	time: string;
	status: 'new' | 'confirmed' | 'cancelled' | string;
	created_at: string;
};

export type Partner = {
	id: string;
	name: string;
	sub_title: string;
	image_url: string;
	position: number;
	created_at: string;
};


