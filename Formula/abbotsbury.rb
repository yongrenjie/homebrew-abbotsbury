class Abbotsbury < Formula
  desc "minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury/archive/refs/tags/v0.1.0.3.tar.gz"
  sha256 "62308adf63af90a7b1bfe9203a675e37152017832c24e9c78b3108972b8f8b87"
  license "MIT"

  # bottle do
  #   root_url "https://github.com/yongrenjie/abbotsbury/releases/download/untagged-f35d0f016a032c324bc2/abbot-v0.1.0.3-macOS.tar.gz"
  #   sha256 cellar: :any,  big_sur: "2cbd6765704ae26f20b19557f022f7ded4c0b9f802cabd3db6a7348921b0cdb8"
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
