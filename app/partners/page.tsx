import { getPartners } from '@/lib/data/partners';
import Image from 'next/image';
import PartnersList from './partners-list';
import AddPartnerButton from './add-partner';

export default async function PartnersPage() {
	const partners = await getPartners();
	return (
		<div className="p-6 space-y-4">
			<div className="flex items-center justify-between">
				<h1 className="text-2xl font-semibold">Partners</h1>
				<AddPartnerButton />
			</div>
			<PartnersList initialPartners={partners} />
		</div>
	);
}


