class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.6.0.0", revision: "5dfe482e372b5626a14d1587d06a52130fbe6793"
  license "MIT"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.5.0.1"
    sha256 cellar: :any, catalina: "4382f99a9476035d7333a575939150bd031b11522814cc9dfea921038c259a27"
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
