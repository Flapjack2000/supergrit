-- ============================================================
-- SUPERGRIT — Initial Migration
-- ============================================================

-- ------------------------------------------------------------
-- profiles
-- Mirrors auth.users. Created automatically on user sign-up
-- via a trigger (add that separately in Supabase dashboard or
-- a second migration).
-- ------------------------------------------------------------
create table public.profiles (
  id            uuid primary key references auth.users (id) on delete cascade,
  display_name  text
);

alter table public.profiles enable row level security;

-- ------------------------------------------------------------
-- frameworks
-- Lookup table. Rows are inserted once (seed file).
-- ------------------------------------------------------------
create table public.frameworks (
  id    serial primary key,
  name  text not null unique
);

alter table public.frameworks enable row level security;

-- ------------------------------------------------------------
-- passive_skills
-- ------------------------------------------------------------
create table public.passive_skills (
  id                    serial primary key,
  name                  text not null unique,
  level_gate            text,
  frameworks            text[] not null default '{}',  -- array of framework names, references frameworks.name
  roleplay_effect       text,
  implementation_notes  text,
  tags                  text
);

alter table public.passive_skills enable row level security;

-- ------------------------------------------------------------
-- skill_cards
-- ------------------------------------------------------------
create table public.skill_cards (
  id                    serial primary key,
  name                  text not null unique,
  cost                  text,
  frameworks            text[] not null default '{}',  -- array of framework names, references frameworks.name
  phase_of_play         text,
  prerequisite_passives text[],                         -- array of passive_skill names (best-effort parsed)
  prerequisite_raw      text,                           -- original string from CSV, preserved for reference
  proposed_effect       text,
  implementation_notes  text,
  tags                  text
);

alter table public.skill_cards enable row level security;

-- ------------------------------------------------------------
-- decks
-- Created by users. Belongs to a profile and one framework.
-- ------------------------------------------------------------
create table public.decks (
  id            uuid primary key default gen_random_uuid(),
  profile_id    uuid not null references public.profiles (id) on delete cascade,
  framework_id  integer not null references public.frameworks (id),
  name          text not null,
  created_at    timestamptz not null default now(),
  updated_at    timestamptz not null default now()
);

alter table public.decks enable row level security;

-- ------------------------------------------------------------
-- deck_skill_cards  (join: decks ↔ skill_cards)
-- Tracks which skill cards a player has unlocked in a deck.
-- ------------------------------------------------------------
create table public.deck_skill_cards (
  deck_id       uuid not null references public.decks (id) on delete cascade,
  skill_card_id integer not null references public.skill_cards (id) on delete cascade,
  unlocked_at   timestamptz not null default now(),
  primary key (deck_id, skill_card_id)
);

alter table public.deck_skill_cards enable row level security;

-- ------------------------------------------------------------
-- deck_passive_skills  (join: decks ↔ passive_skills)
-- Tracks which passive skills a player has unlocked in a deck.
-- ------------------------------------------------------------
create table public.deck_passive_skills (
  deck_id          uuid not null references public.decks (id) on delete cascade,
  passive_skill_id integer not null references public.passive_skills (id) on delete cascade,
  unlocked_at      timestamptz not null default now(),
  primary key (deck_id, passive_skill_id)
);

alter table public.deck_passive_skills enable row level security;
