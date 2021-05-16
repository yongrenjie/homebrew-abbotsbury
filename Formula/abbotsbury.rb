class Abbotsbury < Formula
  desc "Minimalistic command-line reference manager"
  homepage "https://github.com/yongrenjie/abbotsbury"
  url "https://github.com/yongrenjie/abbotsbury.git", tag: "v0.2.2.1", revision: "74f138118657debcee673e0aee8dbab7806b1e1d"
  license "MIT"

  bottle do
    root_url "https://github.com/yongrenjie/abbotsbury/releases/download/v0.2.2.0"
    sha256 cellar: :any, catalina: "6267588808635572efe987a696b46c495d1853f528822ebd6d73cae8f2bb228e"
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
