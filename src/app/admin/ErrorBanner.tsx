export default function ErrorBanner({ error }: { error: string }) {
  return (
    <div className="border border-red-800 bg-red-950/40 rounded-lg p-4 text-red-300 text-sm">
      <strong>Supabase error:</strong> {error}
    </div>
  );
}