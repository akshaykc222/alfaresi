-- Create Bookings Table
-- Run this in Supabase SQL Editor

-- Drop table if exists (use with caution - this will delete all data)
-- DROP TABLE IF EXISTS public.bookings CASCADE;

-- Create bookings table
CREATE TABLE IF NOT EXISTS public.bookings (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  email text NOT NULL,
  phone text NOT NULL,
  consultation_type text NOT NULL,
  date text NOT NULL,
  time text NOT NULL,
  status text DEFAULT 'new',
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Create index on email for faster lookups
CREATE INDEX IF NOT EXISTS idx_bookings_email ON public.bookings(email);

-- Create index on created_at for sorting
CREATE INDEX IF NOT EXISTS idx_bookings_created_at ON public.bookings(created_at DESC);

-- Enable Row Level Security
ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

-- Drop existing policy if it exists
DROP POLICY IF EXISTS "allow_anon_insert_bookings" ON public.bookings;

-- Create policy to allow anonymous users to insert bookings
CREATE POLICY "allow_anon_insert_bookings"
ON public.bookings
FOR INSERT
TO anon
WITH CHECK (true);

-- Optional: Allow authenticated users to read all bookings (for admin panel)
-- Uncomment if you need admin access:
-- CREATE POLICY "allow_authenticated_read_bookings"
-- ON public.bookings
-- FOR SELECT
-- TO authenticated
-- USING (true);

-- Optional: Allow authenticated users to update bookings (for admin panel)
-- Uncomment if you need admin access:
-- CREATE POLICY "allow_authenticated_update_bookings"
-- ON public.bookings
-- FOR UPDATE
-- TO authenticated
-- USING (true)
-- WITH CHECK (true);

-- Create function to update updated_at timestamp
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$ language 'plpgsql';

-- Create trigger to automatically update updated_at
DROP TRIGGER IF EXISTS update_bookings_updated_at ON public.bookings;
CREATE TRIGGER update_bookings_updated_at
  BEFORE UPDATE ON public.bookings
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

-- Verify table structure
SELECT 
  column_name,
  data_type,
  is_nullable,
  column_default
FROM information_schema.columns
WHERE table_schema = 'public'
  AND table_name = 'bookings'
ORDER BY ordinal_position;

