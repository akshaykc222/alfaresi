Alfaresi Admin Panel (Next.js + Supabase)

## Setup

1) Create `.env.local` with:

```bash
NEXT_PUBLIC_SUPABASE_URL=https://zcsrlmhdmmxmmdhrvmlv.supabase.co
NEXT_PUBLIC_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpjc3JsbWhkbW14bW1kaHJ2bWx2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyNjU3ODMsImV4cCI6MjA3ODg0MTc4M30.Oh7DEy0SUoWGkg9IdiVK_8M51iNGS_3Ovjz8fjIFsgU
# Optional for server-side writes and uploads
SUPABASE_SERVICE_ROLE=
NEXT_PUBLIC_SUPABASE_PROJECT_REF=zcsrlmhdmmxmmdhrvmlv
NEXT_PUBLIC_SUPABASE_STORAGE_BUCKET=projects
```

2) Install deps and run:

```bash
npm i
npm run dev
```

## Features
- Auth: Email/password login at `/login`, protected routes via middleware
- Navigation: Dashboard, Bookings, Partners, Settings
- Dashboard: counts + recent bookings
- Bookings: table view, server-side fetching, CSV export API
- Partners: list view, ordered by position
- Settings: env health checks (bucket + edge function)

## RLS Example Policies
Partners (read for anon, write for authenticated):
```sql
-- Read
create policy \"Public read partners\" on public.partners
for select using (true);
-- Write (admins)
create policy \"Authenticated write partners\" on public.partners
for all to authenticated using (auth.role() = 'authenticated') with check (auth.role() = 'authenticated');
```

Bookings (deny public writes; allow admin to update status/delete):
```sql
-- Deny insert/update/delete by anon
revoke insert, update, delete on public.bookings from anon;
-- Allow authenticated update/delete
grant update, delete on public.bookings to authenticated;
```

## Deploy (Vercel)
- Add env vars in Project Settings
- Set `Build Command`: `npm run build`
- Set `Output Directory`: `.next`

## Notes
- All write operations occur via API routes using the Service Role key.
- Storage uploads go through `/api/upload/partner-image` and return a public URL.

# alfaresi
