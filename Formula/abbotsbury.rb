class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.4.1.0", revision: "383f06505fe7918750853e0bbf7c54b6d99e7474"
  license "MIT"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.4.0.0"
    sha256 cellar: :any, catalina: "60df9fae66ad3fb4712d5fd31c529ace727fe80d8761de678a6a98af3400962c"
  end

  depends_on "cabal-install" => :build
  depends_on "ghc" => :build

  uses_from_macos "unzip" => :build
  uses_from_macos "zlib"

  def install
    system "cabal", "v2-update"
    system "cabal", "v2-install", "exe:abbot", *std_cabal_v2_args
  end

  test do
    system "abbot", "--help"
  end
end
