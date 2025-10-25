# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for Kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.30"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.30/kimspect-x86_64-apple-darwin"
      sha256 "4605601df39746bc4c290b9c2497e0ce0f0f935a16f4d89edb6e77c68dde220c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.30/kimspect-aarch64-apple-darwin"
      sha256 "fff82cf465de4266431d9cc230884ef7a73def0951457683bd1cc2848d1a780a"
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
