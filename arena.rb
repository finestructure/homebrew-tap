# Update procedure:
# - update VERSION
# - run: brew upgrade ./arena.rb
# - this will fail but provide the sha256
# - update sha256, confirm update works and push

class Arena < Formula
    VERSION = "0.15.3"
    sha256 "59225cfd659fb8b93983a72460e79a3eed6d5760c641156576be286378125ef5"

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
  