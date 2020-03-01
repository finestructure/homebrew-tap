# Update procedure:
# - update VERSION
# - run: brew upgrade ./arena.rb
# - this will fail but provide the sha256
# - update sha256, confirm update works and push

class Arena < Formula
    VERSION = "0.9.0"
    sha256 "8d22bfaf06b4e82c82c1f1a915d615d2571d473da0d7edcbdc763a5ea0b04b18"

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
  