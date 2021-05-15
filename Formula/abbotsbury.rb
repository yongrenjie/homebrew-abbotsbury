class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.2.0.0", revision: "71507b7d1bc1c1f8d38fca0d36e03c1f91928413"

bottle do
  root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.2.0.0"
  
  sha256 cellar: :any, catalina: "1677edd597a80c450fe9425556acdbe3a0aa1724c984d2a1ee104e7c57dad14d"
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
