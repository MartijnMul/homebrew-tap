cask "plaincontrol" do
  version "0.7.1"
  sha256 "810d9a16c5a6af90dc3f1192bd1abe05c394b466e67f3b0f9c1b415376445132"

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
  depends_on macos: :tahoe

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
