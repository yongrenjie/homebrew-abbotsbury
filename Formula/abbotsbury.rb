class Abbotsbury < Formula
  desc "minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.0.5", revision: "6c9efddc39ca73258894666a9a3752fec607208b"
  sha256 "62308adf63af90a7b1bfe9203a675e37152017832c24e9c78b3108972b8f8b87"
  license "MIT"

  # bottle do
  #   root_url "https://github.com/yongrenjie/homebrew-abbotsbury/releases/download/v0.1.0.3"
  #   rebuild 1
  #   sha256 cellar: :any_skip_relocation, big_sur: "babb8df50cdff44e2b97615ee43aa367dcf5d3b75b4313b44d45e6e5430badf6"
  # end

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
