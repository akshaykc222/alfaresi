'use client';
import { DndContext, closestCenter, DragEndEvent } from '@dnd-kit/core';
import { arrayMove, SortableContext, verticalListSortingStrategy, useSortable } from '@dnd-kit/sortable';
import { useState } from 'react';
import { Partner } from '@/lib/supabase/types';
import Image from 'next/image';
import EditPartnerButton from './edit-partner';

export default function PartnersList({ initialPartners }: { initialPartners: Partner[] }) {
	const [items, setItems] = useState(initialPartners);
	async function onDragEnd(event: DragEndEvent) {
		const { active, over } = event;
		if (!over || active.id === over.id) return;
		const oldIndex = items.findIndex((i) => i.id === active.id);
		const newIndex = items.findIndex((i) => i.id === over.id);
		const next = arrayMove(items, oldIndex, newIndex).map((p, idx) => ({
			...p,
			position: idx
		}));
		setItems(next);
		// optimistic update; fire batch
		await fetch('/api/partners/reorder', {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify(next.map((p) => ({ id: p.id, position: p.position })))
		});
	}
	return (
		<DndContext collisionDetection={closestCenter} onDragEnd={onDragEnd}>
			<SortableContext items={items.map((i) => i.id)} strategy={verticalListSortingStrategy}>
				<div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4">
					{items.map((p) => (
						<SortableCard key={p.id} partner={p} />
					))}
				</div>
			</SortableContext>
		</DndContext>
	);
}

function SortableCard({ partner }: { partner: Partner }) {
	const { attributes, listeners, setNodeRef, transform, transition } = useSortable({ id: partner.id });
	const style: React.CSSProperties = {
		transform: transform ? `translate3d(${transform.x}px, ${transform.y}px, 0)` : undefined,
		transition
	};
	return (
		<div ref={setNodeRef} style={style} className="card p-3 flex gap-3 items-center hover:shadow-md transition-shadow">
			{/* Drag handle */}
			<div className="h-6 w-6 rounded bg-blue-100 flex items-center justify-center text-xs text-blue-800 cursor-grab active:cursor-grabbing select-none" {...attributes} {...listeners}>
				::
			</div>
			{partner.image_url ? (
				<Image
					src={partner.image_url}
					alt={partner.name}
					width={64}
					height={64}
					loading="eager"
					className="h-16 w-16 rounded object-cover bg-gray-100"
				/>
			) : (
				<div className="h-16 w-16 rounded bg-gray-100" />
			)}
			<div>
				<div className="font-medium">{partner.name}</div>
				<div className="text-sm text-blue-700">{partner.sub_title}</div>
			</div>
			<div className="ml-auto flex items-center gap-2">
				<span className="text-xs text-gray-500">#{partner.position}</span>
				<EditPartnerButton partner={partner} />
			</div>
		</div>
	);
}


