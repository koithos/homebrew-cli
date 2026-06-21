# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.45"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.45/kimspect-x86_64-apple-darwin"
      sha256 "c5dca72c06c2db7a7378bd1dc75ffac51d518ff9d343415a66864db2f4861168"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.45/kimspect-aarch64-apple-darwin"
      sha256 "33e25d951815aeb18ac21180ac27b941a8f1566fbe47da58174c0390f4702046"
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
