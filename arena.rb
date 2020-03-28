# Update procedure:
# - update VERSION
# - run: brew upgrade ./arena.rb
# - this will fail but provide the sha256
# - update sha256, confirm update works and push

class Arena < Formula
    VERSION = "0.15.1"
    sha256 "4e73402e447e9b079ff4fd27edb3a835e4a97d0f3fbcae89d221810011fb98d9"

    desc "Describe your project"
    homepage "https://github.com/finestructure/Arena"
    url "https://github.com/finestructure/Arena/archive/#{VERSION}.tar.gz"
    
    def install
      # write version to file (for tool version reporting)
      File.write('Sources/ArenaCore/Version.swift', "public let ArenaVersion = \"#{VERSION}\"")

      system "swift", "build",
          "--configuration", "release",
          "--disable-sandbox"
    
      bin.install '.build/release/arena'
    end
  end
  