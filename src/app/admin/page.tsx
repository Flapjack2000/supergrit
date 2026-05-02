"use client";

import Header from "./Header";
import ErrorBanner from "./ErrorBanner";
import TableCounts from "./TableCounts";
import FrameworkList from "./FrameworkList";
import DetailPanel from "./DetailPanel";
import { useSupabaseData } from "./useSupabaseData";

export default function SupabaseTestPage() {
  const {
    frameworks,
    selected,
    skillCards,
    passives,
    counts,
    loading,
    detailLoading,
    error,
    selectFramework,
  } = useSupabaseData();

  return (
    <main className="min-h-screen bg-zinc-950 text-zinc-100 p-8 font-mono">
      <div className="max-w-5xl mx-auto space-y-8">

        <Header loading={loading} error={error} />

        {error && <ErrorBanner error={error} />}

        <TableCounts loading={loading} counts={counts} />

        <FrameworkList
          loading={loading}
          frameworks={frameworks}
          selected={selected}
          onSelect={selectFramework}
        />

        {selected && (
          <DetailPanel
            selected={selected}
            skillCards={skillCards}
            passives={passives}
            detailLoading={detailLoading}
          />
        )}
      </div>
    </main>
  );
}