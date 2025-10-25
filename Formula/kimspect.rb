# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.32"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.32/kimspect-x86_64-apple-darwin"
      sha256 "52dc881eef43d29558c26c28d099f692dbd6b426231fc80a593ac9ab23f836e5"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.32/kimspect-aarch64-apple-darwin"
      sha256 "2e7ed719255ba804e92f23c20860b66b03b63575a74a2320e7bbe045c35232bf"
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
