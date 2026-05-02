"use client";

import { useEffect, useState } from "react";
import { createClient } from "@/lib/client";
import {
  Framework,
  SkillCard,
  PassiveSkill,
  TableCount,
} from "./types";

export function useSupabaseData() {
  const supabase = createClient();

  const [frameworks, setFrameworks] = useState<Framework[]>([]);
  const [selected, setSelected] = useState<Framework | null>(null);
  const [skillCards, setSkillCards] = useState<SkillCard[]>([]);
  const [passives, setPassives] = useState<PassiveSkill[]>([]);
  const [counts, setCounts] = useState<TableCount[]>([]);
  const [loading, setLoading] = useState(true);
  const [detailLoading, setDetailLoading] = useState(false);
  const [error, setError] = useState<string | null>(null);

  // On mount: fetch frameworks + row counts for all tables
  useEffect(() => {
    async function init() {
      setLoading(true);
      setError(null);
      try {
        const [fwRes, scRes, psRes, deckRes, profileRes] = await Promise.all([
          supabase.from("frameworks").select("*").order("name"),
          supabase.from("skill_cards").select("id", { count: "exact", head: true }),
          supabase.from("passive_skills").select("id", { count: "exact", head: true }),
          supabase.from("decks").select("id", { count: "exact", head: true }),
          supabase.from("profiles").select("id", { count: "exact", head: true }),
        ]);

        if (fwRes.error) throw fwRes.error;

        setFrameworks(fwRes.data ?? []);
        setCounts([
          { table: "frameworks", count: fwRes.data?.length ?? 0 },
          { table: "skill_cards", count: scRes.count ?? 0 },
          { table: "passive_skills", count: psRes.count ?? 0 },
          { table: "decks", count: deckRes.count ?? 0 },
          { table: "profiles", count: profileRes.count ?? 0 },
        ]);
      } catch (e: unknown) {
        setError(e instanceof Error ? e.message : "Unknown error");
      } finally {
        setLoading(false);
      }
    }

    init();
  }, []);

  // When a framework is selected: fetch its cards + passives
  async function selectFramework(fw: Framework) {
    if (selected?.id === fw.id) {
      setSelected(null);
      setSkillCards([]);
      setPassives([]);
      return;
    }

    setSelected(fw);
    setDetailLoading(true);

    try {
      const [scRes, psRes] = await Promise.all([
        supabase
          .from("skill_cards")
          .select("id, name, cost, phase_of_play, prerequisite_passives, tags")
          .contains("frameworks", [fw.name])
          .order("name"),
        supabase
          .from("passive_skills")
          .select("id, name, level_gate, roleplay_effect")
          .contains("frameworks", [fw.name])
          .order("name"),
      ]);

      if (scRes.error) throw scRes.error;
      if (psRes.error) throw psRes.error;

      setSkillCards(scRes.data ?? []);
      setPassives(psRes.data ?? []);
    } catch (e: unknown) {
      setError(e instanceof Error ? e.message : "Unknown error");
    } finally {
      setDetailLoading(false);
    }
  }

  return {
    frameworks,
    selected,
    skillCards,
    passives,
    counts,
    loading,
    detailLoading,
    error,
    selectFramework,
  };
}