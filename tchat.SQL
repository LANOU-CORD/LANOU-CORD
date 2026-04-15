create table if not exists messages (id bigint primary key generated always as identity, created_at timestamptz default now(), username text, content text, color text, channel text default 'général');
create table if not exists channels (id bigint primary key generated always as identity, name text unique);
insert into channels (name) values ('général'), ('annonces'), ('documents') on conflict do nothing;
alter publication supabase_realtime add table messages;
alter publication supabase_realtime add table channels;