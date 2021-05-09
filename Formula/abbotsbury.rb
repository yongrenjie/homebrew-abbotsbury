class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.1.0", revision: "8d07b79d4b4ee9cee44b8aab6721b33f19f2f0c9"

bottle do
  root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.1.0"
  
  sha256 cellar: :any, catalina: "eb0eaaef07c0d5c6ac1d08a6472ae285a92f68e0d4f1fd7094e8639b2c0e6734"
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
