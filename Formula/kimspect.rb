# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.34"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.34/kimspect-x86_64-apple-darwin"
      sha256 "91fa17f17883631ca73bdd771216067b4c641001fec54efd28a1e2db07a1652c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.34/kimspect-aarch64-apple-darwin"
      sha256 "83d91c6024825d8ca72d84aee33065702346f824fd7938f175baf7587b5945c9"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "kimspect-x86_64-apple-darwin" => "kimspect"
    elsif Hardware::CPU.arm?
      bin.install "kimspect-aarch64-apple-darwin" => "kimspect"
    end
  end

  test do
    system "#{bin}/kimspect", "--version"
  end
end
