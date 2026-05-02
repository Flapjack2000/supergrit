import { Separator } from "@/components/ui/separator";
import SkillCards from "./SkillCards";
import PassiveSkills from "./PassiveSkills";

export default function DetailPanel({
  selected,
  skillCards,
  passives,
  detailLoading,
}: any) {
  return (
    <div className="space-y-6">
      <Separator className="bg-zinc-800" />
      <p className="text-xs text-zinc-500 uppercase tracking-widest">
        {selected.name} · {skillCards.length} skill cards · {passives.length} passives
      </p>

      <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
        <SkillCards skillCards={skillCards} detailLoading={detailLoading} />
        <PassiveSkills passives={passives} detailLoading={detailLoading} />
      </div>
    </div>
  );
}