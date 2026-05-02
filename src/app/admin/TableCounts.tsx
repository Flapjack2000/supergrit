import { Skeleton } from "@/components/ui/skeleton";

export default function TableCounts({
  loading,
  counts,
}: {
  loading: boolean;
  counts: { table: string; count: number }[];
}) {
  return (
    <div>
      <p className="text-xs text-zinc-500 uppercase tracking-widest mb-3">Row counts</p>
      <div className="grid grid-cols-5 gap-3">
        {loading
          ? Array.from({ length: 5 }).map((_, i) => (
            <Skeleton key={i} className="h-16 rounded-lg bg-zinc-800" />
          ))
          : counts.map(({ table, count }) => (
            <div
              key={table}
              className="bg-zinc-900 border border-zinc-800 rounded-lg p-3 text-center"
            >
              <p className="text-2xl font-bold text-white">{count}</p>
              <p className="text-[10px] text-zinc-500 mt-0.5">{table}</p>
            </div>
          ))}
      </div>
    </div>
  );
}