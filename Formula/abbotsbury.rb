class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  license "MIT"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.1.0.11", revision: "e7586138130e1565efbcb23a8d50a0e46d9ab0fb"

bottle do
  root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.1.0.11"
  
  sha256 cellar: :any, catalina: "8e17b5867c9e3a4d42f781aa611ca1c104dc4573819827de5f34f1fa2716257d"
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
