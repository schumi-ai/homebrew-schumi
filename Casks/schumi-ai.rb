cask "schumi-ai" do
  version "0.38.0"
  sha256 "c8fed62d3bc554588935fa9b6a248e3c59b40437cce9f547854d6b398e26c960"

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
