-- Insert Partners with Storage URLs
-- Run this in Supabase SQL Editor

-- Base URL for Supabase Storage
-- https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/

INSERT INTO public.partners (name, sub_title, image_url, position) VALUES
  ('Payle', 'Digital Marketing & Advertising', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/payle.png', 10),
  ('Dalil', 'Artificial Intelligence & Language Technology', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/dalil.png', 20),
  ('Bringle', 'IT Consulting & Software Solutions', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/bringle.png', 30),
  ('Construction', 'Creative Marketing & Branding', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/construction.png', 40),
  ('Law Office', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/law_office.png', 50),
  ('GDC Kuwait', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/gdc_kuwait.png', 60),
  ('Metrash', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/metrash.png', 70),
  ('Auto Market', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/automarket.png', 80),
  ('Tataman', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/tataman.png', 90),
  ('NEOM', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/neom.png', 100),
  ('Muhamik', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/muhamik.png', 110),
  ('Traininate', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/traininate.png', 120),
  ('Public Prosecution', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/public_prosticution.png', 130),
  ('NIU', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/niu.png', 140),
  ('HBeam', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/hbeam.png', 150),
  ('AX', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/ax.png', 160),
  ('Rita', '', 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co/storage/v1/object/public/projects/rita.png', 170)
ON CONFLICT DO NOTHING;

-- Verify the insert
SELECT id, name, sub_title, image_url, position 
FROM public.partners 
ORDER BY position;

