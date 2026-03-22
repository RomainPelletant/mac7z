cask "mac7z" do
  version "0.9.0"
  sha256 "PLACEHOLDER"

  url "https://github.com/romainpelletant/mac7z/releases/download/v#{version}/mac7z-#{version}-macos.dmg"
  name "mac7z"
  desc "Fast, minimal archive manager for macOS and Linux, powered by 7-Zip"
  homepage "https://github.com/romainpelletant/mac7z"

  app "mac7z.app"

  zap trash: [
    "~/Library/Application Support/mac7z",
    "~/Library/Caches/com.mac7z.app",
    "~/Library/Preferences/com.mac7z.app.plist",
  ]
end
