cask "plaincontrol" do
  version "0.3.0"
  sha256 "ea87b328ca965ba02fbba5117c49b678df61fe1cabdd9e6e13dedebe5e4627fb"

  url "https://github.com/MartijnMul/plaincontrol/releases/download/v#{version}/Plaincontrol.dmg"
  name "Plaincontrol"
  desc "Menu bar app that shows which Claude Code session needs you"
  homepage "https://github.com/MartijnMul/plaincontrol"

  livecheck do
    url :url
    strategy :github_latest
  end

  # No `auto_updates true`, although the app updates itself through Sparkle: it does so only
  # when the user allows it, and with `auto_updates` `brew upgrade` would skip it, leaving
  # those who declined without updates.
  depends_on macos: :golden_gate

  app "Plaincontrol.app"

  zap trash: [
    "~/.config/plaincontrol",
    "~/Library/Application Support/Plaincontrol",
    "~/Library/Preferences/io.github.martijnmul.plaincontrol.plist",
  ]

  caveats <<~EOS
    Plaincontrol hears from Claude Code through its plugin. In Claude Code, run:
      /plugin marketplace add MartijnMul/plaincontrol
      /plugin install plaincontrol@plaincontrol
  EOS
end
