class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.1.1", revision: "0ed890eaad40cbf4a48f1ff89b35db9931183ca5"

bottle do
  root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.1.1"
  
  sha256 cellar: :any, catalina: "9e7a918f302a00876b850a9c7798a9cadb2ebfe043ac4f1ba5adf3196918f79c"
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
