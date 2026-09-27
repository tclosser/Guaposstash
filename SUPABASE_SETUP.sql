-- Run in Supabase > SQL Editor, then paste your Project URL and anon key into COMMUNITY in index.html
create table reviews (
  id bigint generated always as identity primary key,
  created_at timestamptz default now(),
  dish text not null,
  yum int not null check (yum between 1 and 5),
  tags text[] default '{}',
  tweak text check (char_length(tweak) <= 500),
  review text check (char_length(review) <= 1000),
  name text check (char_length(name) <= 40),
  servings int
);
alter table reviews enable row level security;
create policy "anyone can read" on reviews for select using (true);
create policy "anyone can add" on reviews for insert with check (true);
