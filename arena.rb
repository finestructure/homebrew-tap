# Update procedure:
# - update VERSION
# - run: brew upgrade ./arena.rb
# - this will fail but provide the sha256
# - update sha256, confirm update works and push

class Arena < Formula
    VERSION = "0.9.1"
    sha256 "d6933eb13da1a32853f8fffb6e45d27c01f01848307fab46ec9d25c5f3e2dcdd"

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
  