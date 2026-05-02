import { Skeleton } from "@/components/ui/skeleton";
import { Framework } from "./types";

type Props = {
  loading: boolean;
  frameworks: Framework[];
  selected: Framework | null;
  onSelect: (fw: Framework) => void;
};

export default function FrameworkList({
  loading,
  frameworks,
  selected,
  onSelect,
}: Props) {
  return (
    <div>
      <p className="text-xs text-zinc-500 uppercase tracking-widest mb-3">
        Frameworks · click to explore
      </p>

      {loading ? (
        <div className="flex gap-2 flex-wrap">
          {Array.from({ length: 9 }).map((_, i) => (
            <Skeleton key={i} className="h-8 w-28 rounded-full bg-zinc-800" />
          ))}
        </div>
      ) : (
        <div className="flex gap-2 flex-wrap">
          {frameworks.map((fw) => (
            <button
              key={fw.id}
              onClick={() => onSelect(fw)}
              className={`px-4 py-1.5 rounded-full text-sm font-medium border transition-all ${selected?.id === fw.id
                  ? "bg-emerald-500 border-emerald-500 text-black"
                  : "bg-zinc-900 border-zinc-700 text-zinc-300 hover:border-emerald-600 hover:text-white"
                }`}
            >
              {fw.name}
            </button>
          ))}
        </div>
      )}
    </div>
  );
}