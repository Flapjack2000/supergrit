export type Framework = {
  id: number;
  name: string;
};

export type SkillCard = {
  id: number;
  name: string;
  cost: string | null;
  phase_of_play: string | null;
  prerequisite_passives: string[] | null;
  tags: string | null;
};

export type PassiveSkill = {
  id: number;
  name: string;
  level_gate: string | null;
  roleplay_effect: string | null;
};

export type TableCount = {
  table: string;
  count: number;
};