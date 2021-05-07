class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.0.9", revision: "5d8a06e95ea9b45e4f02ee4f62e80aa54ce196d8"

bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.0.9"
    
    sha256 cellar: :any, catalina: "ae3c48d2171d82e8622bec3b7f19bc4534d067c30c96ac63f9d400d2ca9d1cb4"
  end

  license "MIT"

  # much of this is taken from pandoc's formula.
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
