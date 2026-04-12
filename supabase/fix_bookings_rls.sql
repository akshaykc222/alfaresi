-- Fix RLS Policy for Bookings Table
-- Run this in Supabase SQL Editor

-- Step 1: Verify table exists and RLS is enabled
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.tables 
    WHERE table_schema = 'public' 
    AND table_name = 'bookings'
  ) THEN
    -- Create bookings table if it doesn't exist
    CREATE TABLE public.bookings (
      id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
      name text NOT NULL,
      email text NOT NULL,
      phone text NOT NULL,
      consultation_type text NOT NULL,
      date text NOT NULL,
      time text NOT NULL,
      created_at timestamptz DEFAULT now()
    );
  END IF;
END $$;

-- Step 2: Enable RLS
ALTER TABLE public.bookings ENABLE ROW LEVEL SECURITY;

-- Step 3: Drop ALL existing policies on bookings (to start fresh)
DO $$
DECLARE
  r RECORD;
BEGIN
  FOR r IN (SELECT policyname FROM pg_policies WHERE tablename = 'bookings' AND schemaname = 'public') LOOP
    EXECUTE 'DROP POLICY IF EXISTS ' || quote_ident(r.policyname) || ' ON public.bookings';
  END LOOP;
END $$;

-- Step 4: Create the insert policy for anonymous users
CREATE POLICY "allow_anon_insert_bookings"
ON public.bookings
FOR INSERT
TO anon
WITH CHECK (true);

-- Step 5: Verify the policy was created
SELECT 
  schemaname,
  tablename,
  policyname,
  permissive,
  roles,
  cmd,
  qual,
  with_check
FROM pg_policies 
WHERE tablename = 'bookings' 
AND schemaname = 'public';

