class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.0.10", revision: "00080be8312e1a4a72b85ad3e46d8ad8dfe5b2bf"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.0.10"
    sha256 cellar: :any, catalina: "a36b1dff543e3a9b007637c44d334a5a063b8f8bafd62a9ce4c822096451de39"
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
