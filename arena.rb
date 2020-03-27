# Update procedure:
# - update VERSION
# - run: brew upgrade ./arena.rb
# - this will fail but provide the sha256
# - update sha256, confirm update works and push

class Arena < Formula
    VERSION = "0.14.0"
    sha256 "f82d792785ca65734601ca6d890824556763291d4fe59ca13ec5bd40795906af"

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
  