'use client';
import * as React from 'react';

export function DataTable<T>({
	columns,
	rows,
	keyField
}: {
	columns: { key: keyof T; header: string }[];
	rows: T[];
	keyField: keyof T;
}) {
	return (
		<div className="overflow-x-auto border rounded-md">
			<table className="min-w-full text-sm">
				<thead className="bg-gray-50">
					<tr>
						{columns.map((c) => (
							<th key={String(c.key)} className="text-left px-3 py-2">
								{c.header}
							</th>
						))}
					</tr>
				</thead>
				<tbody>
					{rows.map((row) => (
						<tr key={String(row[keyField])} className="border-t">
							{columns.map((c) => (
								<td key={String(c.key)} className="px-3 py-2">
									{String(row[c.key] ?? '')}
								</td>
							))}
						</tr>
					))}
				</tbody>
			</table>
		</div>
	);
}


