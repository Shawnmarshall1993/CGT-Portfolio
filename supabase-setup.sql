-- Run this in your Supabase SQL Editor (Dashboard → SQL Editor → New Query)
-- Paste all of this, then click Run

-- PROPERTIES TABLE
create table if not exists properties (
  id bigint primary key,
  addr text,
  city text,
  beds text,
  sqft numeric default 0,
  rent numeric default 0,
  deposit numeric default 0,
  appraised numeric default 0,
  loan numeric default 0,
  payment numeric default 0,
  taxes numeric default 0,
  ins numeric default 0,
  repair numeric default 0,
  type text default 'stable',
  contact text,
  phone text,
  note text,
  created_at timestamp with time zone default now()
);

-- SETTINGS TABLE (stores rates, preferences)
create table if not exists settings (
  key text primary key,
  value text,
  updated_at timestamp with time zone default now()
);

-- Allow public read/write (your app uses anon key)
alter table properties enable row level security;
alter table settings enable row level security;

create policy "Allow all" on properties for all using (true) with check (true);
create policy "Allow all" on settings for all using (true) with check (true);
