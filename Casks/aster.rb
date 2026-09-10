cask "aster" do
  version "1.9.1"
  sha256 "a9f811e7b6ed7a770230dd9f2870f17212673da45c5cb853369aa2d8ccdb7cfb"

  url "https://github.com/youseonghyeon/aster/releases/download/v#{version}/Aster_#{version}_universal.dmg"
  name "Aster"
  desc "Markdown reader with document notes and live preview"
  homepage "https://github.com/youseonghyeon/aster"

  auto_updates true
  depends_on macos: :high_sierra

  app "Aster.app"
end
