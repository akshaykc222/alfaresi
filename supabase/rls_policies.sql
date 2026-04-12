-- Row Level Security Policies for Alfaresi App

-- ============================================
-- BOOKINGS TABLE POLICIES
-- ============================================

-- Ensure RLS is enabled
ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Allow anonymous inserts on bookings" ON public.bookings;
DROP POLICY IF EXISTS "Allow anonymous read bookings" ON public.bookings;

-- Allow anonymous users to insert bookings (for app users making bookings)
CREATE POLICY "Allow anonymous inserts on bookings"
ON public.bookings
FOR INSERT
TO anon
WITH CHECK (true);

-- Allow anonymous users to read bookings (optional - remove if you don't want public read access)
-- Uncomment if needed:
-- CREATE POLICY "Allow anonymous read bookings"
-- ON public.bookings
-- FOR SELECT
-- TO anon
-- USING (true);

-- ============================================
-- PARTNERS TABLE POLICIES
-- ============================================

-- Ensure RLS is enabled
ALTER TABLE public.partners ENABLE ROW LEVEL SECURITY;

-- Drop existing policies if they exist
DROP POLICY IF EXISTS "Allow anonymous read partners" ON public.partners;

-- Allow anonymous users to read partners (for displaying in app)
CREATE POLICY "Allow anonymous read partners"
ON public.partners
FOR SELECT
TO anon
USING (true);

