cask "schumi-ai" do
  version "0.40.0"
  sha256 "c933d7f75a29949aa1c12ff59c71eae7d9ea8209837c2fe190e3595dfbe84c8b"

  url "https://schumi.pro/downloads/Schumi.ai_#{version}_universal.dmg"
  name "Schumi.ai"
  desc "Persönlicher KI-Begleiter, der komplett lokal auf dem Rechner läuft"
  homepage "https://schumi.pro/"

  livecheck do
    url "https://schumi.pro/updates/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  # Die App aktualisiert sich selbst (Tauri-Updater); `brew upgrade` ist trotzdem möglich.
  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Schumi.ai.app"

  zap trash: [
    "~/Library/Application Support/ai.schumi.desktop",
    "~/Library/Caches/ai.schumi.desktop",
    "~/Library/Logs/ai.schumi.desktop",
    "~/Library/Preferences/ai.schumi.desktop.plist",
    "~/Library/Saved Application State/ai.schumi.desktop.savedState",
    "~/Library/WebKit/ai.schumi.desktop",
  ]
end
