cask "plaincontrol" do
  version "0.4.0"
  sha256 "88c361f33726e5485843e5ebb395d77a706da90fc072b873bf06c4001d154155"

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
