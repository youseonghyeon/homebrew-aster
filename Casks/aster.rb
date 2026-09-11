cask "aster" do
  version "1.9.2"
  sha256 "1e02254f4182c861d07401da463014d652c953a0a1e92e03a1289c852c7705be"

  url "https://github.com/youseonghyeon/aster/releases/download/v#{version}/Aster_#{version}_universal.dmg"
  name "Aster"
  desc "Markdown reader with document notes and live preview"
  homepage "https://github.com/youseonghyeon/aster"

  auto_updates true
  depends_on :macos

  app "Aster.app"
end
