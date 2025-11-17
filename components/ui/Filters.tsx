'use client';
import React from 'react';

export function Filters({
	children
}: {
	children: React.ReactNode;
}) {
	return <div className="flex flex-wrap gap-2 items-center">{children}</div>;
}


