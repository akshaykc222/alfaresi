'use client';
import React from 'react';

export function Modal({
	open,
	onClose,
	title,
	children,
	footer
}: {
	open: boolean;
	onClose: () => void;
	title?: string;
	children: React.ReactNode;
	footer?: React.ReactNode;
}) {
	if (!open) return null;
	return (
		<div className="fixed inset-0 z-50 flex items-center justify-center">
			<div className="absolute inset-0 bg-black/40" onClick={onClose} />
			<div className="relative z-10 w-full max-w-lg rounded-md bg-white shadow border">
				{title ? <div className="px-4 py-3 border-b font-medium">{title}</div> : null}
				<div className="p-4">{children}</div>
				{footer ? <div className="px-4 py-3 border-t">{footer}</div> : null}
			</div>
		</div>
	);
}


