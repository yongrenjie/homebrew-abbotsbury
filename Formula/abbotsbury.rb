class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.4.0.0", revision: "b60023d43634a4002f48fc9e752cc3d6f60dc6b6"
  license "MIT"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.3.1.0"
    sha256 cellar: :any, catalina: "5b670fd0c644c73bbb79b8670687230d1a0618d2b2af5b500ab8b95aa5f175da"
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
