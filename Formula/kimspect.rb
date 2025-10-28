# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.33"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.33/kimspect-x86_64-apple-darwin"
      sha256 "3fa8c00f23b19ccd8dd05e645e5026acec134b88514daa606a87f69ac5da03f4"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.33/kimspect-aarch64-apple-darwin"
      sha256 "892ab24f1d449b1a2a7190fa60ce514f88c89ca409dcc54fceb33bca8453b18b"
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
