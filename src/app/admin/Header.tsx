import { Database, CheckCircle2, AlertCircle } from "lucide-react";

export default function Header({ loading, error }: { loading: boolean; error: string | null }) {
  return (
    <div className="flex items-center gap-3">
      <Database className="text-emerald-400" size={28} />
      <div>
        <h1 className="text-2xl font-bold tracking-tight text-white">
          SUPERGRIT · DB Test
        </h1>
        <p className="text-xs text-zinc-500 mt-0.5">
          Reads from frameworks, skill_cards, passive_skills, decks, profiles
        </p>
      </div>
      <div className="ml-auto">
        {!loading && !error && (
          <span className="flex items-center gap-1.5 text-emerald-400 text-xs">
            <CheckCircle2 size={14} />
            Database Connected
          </span>
        )}
        {error && (
          <span className="flex items-center gap-1.5 text-red-400 text-xs">
            <AlertCircle size={14} />
            Database Error
          </span>
        )}
      </div>
    </div>
  );
}