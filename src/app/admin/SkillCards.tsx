import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Skeleton } from "@/components/ui/skeleton";
import { Badge } from "@/components/ui/badge";
import { Zap } from "lucide-react";
import { SkillCard } from "./types";

type Props = {
  skillCards: SkillCard[];
  detailLoading: boolean;
};

export default function SkillCards({ skillCards, detailLoading }: Props) {
  return (
    <div className="space-y-2">
      <div className="flex items-center gap-2 text-emerald-400 mb-3">
        <Zap size={14} />
        <span className="text-xs font-semibold uppercase tracking-widest">
          Skill Cards
        </span>
      </div>

      {detailLoading
        ? Array.from({ length: 4 }).map((_, i) => (
          <Skeleton key={i} className="h-20 rounded-lg bg-zinc-800" />
        ))
        : skillCards.map((card) => (
          <Card key={card.id} className="bg-zinc-900 border-zinc-800">
            <CardHeader className="pb-1 pt-3 px-4">
              <CardTitle className="text-sm text-white font-semibold flex justify-between items-start gap-2">
                {card.name}
                {card.cost !== null && (
                  <span className="text-[10px] bg-zinc-800 text-zinc-400 px-2 py-0.5 rounded-full shrink-0">
                    cost: {card.cost}
                  </span>
                )}
              </CardTitle>
            </CardHeader>

            <CardContent className="px-4 pb-3 space-y-1.5">
              {card.phase_of_play && (
                <p className="text-[11px] text-zinc-500">
                  {card.phase_of_play}
                </p>
              )}

              {card.prerequisite_passives &&
                card.prerequisite_passives.length > 0 && (
                  <div className="flex flex-wrap gap-1">
                    {card.prerequisite_passives.map((p) => (
                      <Badge
                        key={p}
                        variant="outline"
                        className="text-[10px] border-zinc-700 text-zinc-400 py-0"
                      >
                        {p}
                      </Badge>
                    ))}
                  </div>
                )}

              {card.tags && (
                <p className="text-[10px] text-zinc-600 italic">
                  {card.tags}
                </p>
              )}
            </CardContent>
          </Card>
        ))}
    </div>
  );
}