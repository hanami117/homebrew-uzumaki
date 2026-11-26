cask "uzumaki" do
  version "0.4.5"
  sha256 "78a7d41e9181e9279352140f72c8207ec43076f76495b199471e8236f3a0eb8c"

  url "https://github.com/hanami117/uzumaki/releases/download/v#{version}/Uzumaki-#{version}.dmg"
  name "Uzumaki"
  desc "Native desktop client for Apple Music"
  homepage "https://getuzumaki.app/"

  livecheck do
    url :url
    strategy :github_latest
  end

  # The app's update notice only points to the package manager; it never replaces itself.
  auto_updates false
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Uzumaki.app"
  binary "#{appdir}/Uzumaki.app/Contents/MacOS/uzu"

  uninstall quit: "io.github.hanami117.uzumaki"

  # Not removable here: the sign-in's Keychain item ("Safe Storage"), which Keychain Access can delete.
  zap trash: [
    "~/.cache/uzumaki",
    "~/.config/uzumaki",
    "~/.local/share/uzumaki",
    "~/.local/state/uzumaki",
    "~/Library/Application Support/uzumaki",
    "~/Library/Logs/Uzumaki",
    "~/Library/Preferences/io.github.hanami117.uzumaki.plist",
    "~/Library/Saved Application State/io.github.hanami117.uzumaki.savedState",
  ]

  caveats <<~EOS
    Uzumaki is not notarized, so macOS refuses the first launch. Open
      System Settings → Privacy & Security
    and click "Open Anyway". Or run:
      xattr -dr com.apple.quarantine #{appdir}/Uzumaki.app
    An Apple Music subscription is needed for playback.
  EOS
end
