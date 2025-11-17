'use client';
import React from 'react';

export function Drawer({
	open,
	onClose,
	title,
	children
}: {
	open: boolean;
	onClose: () => void;
	title?: string;
	children: React.ReactNode;
}) {
	return (
		<div className={`fixed inset-0 z-50 ${open ? '' : 'pointer-events-none'}`}>
			<div
				className={`absolute inset-0 bg-black/40 transition-opacity ${open ? 'opacity-100' : 'opacity-0'}`}
				onClick={onClose}
			/>
			<div
				className={`absolute right-0 top-0 h-full w-full max-w-md bg-white shadow-lg transition-transform ${open ? 'translate-x-0' : 'translate-x-full'}`}
			>
				<div className="h-14 flex items-center px-4 border-b font-medium">{title}</div>
				<div className="p-4">{children}</div>
			</div>
		</div>
	);
}


