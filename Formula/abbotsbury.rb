class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.1.2", revision: "c0f73f8878347660d8a2fc984321484a37806cdf"

bottle do
  root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.1.2"
  
  sha256 cellar: :any, catalina: "7717a86a5e99ec8dd56e86dcbc447ab6243b9d32edaebf404bd2a6728a466e1c"
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
