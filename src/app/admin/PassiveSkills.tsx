import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";
import { Layers } from "lucide-react";
import { PassiveSkill } from "./types";

type Props = {
  passives: PassiveSkill[];
  detailLoading: boolean;
};

export default function PassiveSkills({ passives, detailLoading }: Props) {
  return (
    <div className="space-y-2">
      <div className="flex items-center gap-2 text-sky-400 mb-3">
        <Layers size={14} />
        <span className="text-xs font-semibold uppercase tracking-widest">
          Passive Skills
        </span>
      </div>

      {detailLoading
        ? Array.from({ length: 3 }).map((_, i) => (
          <Skeleton key={i} className="h-20 rounded-lg bg-zinc-800" />
        ))
        : passives.map((p) => (
          <Card key={p.id} className="bg-zinc-900 border-zinc-800">
            <CardHeader className="pb-1 pt-3 px-4">
              <CardTitle className="text-sm text-white font-semibold flex justify-between items-start gap-2">
                {p.name}
                {p.level_gate && (
                  <span className="text-[10px] bg-zinc-800 text-zinc-400 px-2 py-0.5 rounded-full shrink-0">
                    unlocks at: {p.level_gate}
                  </span>
                )}
              </CardTitle>
            </CardHeader>

            {p.roleplay_effect && (
              <CardContent className="px-4 pb-3">
                <p className="text-[11px] text-zinc-400">
                  {p.roleplay_effect}
                </p>
              </CardContent>
            )}
          </Card>
        ))}
    </div>
  );
}