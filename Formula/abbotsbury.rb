class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.2.1.0", revision: "eabd177a7f0e17236c7cd9add61bd74839704cca"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.2.1.0"
    sha256 cellar: :any, catalina: "5da16141ad5864d48c6ad3ad66fc8f2246972e1e63720b026e07bfab2415163f"
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
