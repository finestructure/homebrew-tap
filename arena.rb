class Arena < Formula
    desc "Describe your project"
    homepage "https://github.com/finestructure/Arena"
    url "https://github.com/finestructure/Arena/archive/0.8.0.tar.gz"
    
    sha256 "fe2f27db552bcda40c035b0f46f61079d40f14a05e32ad080f7cff52ea071f72"

    def install
      system "swift", "build",
          "--configuration", "release",
          "--disable-sandbox"
    
      bin.install '.build/release/arena'
    end
  end
  