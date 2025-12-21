# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "main"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/main/kimspect-x86_64-apple-darwin"
      sha256 "e9d8edd2105340881b4f2438fc9b6271835998a2b9741d721eafbf0b35192f39"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/main/kimspect-aarch64-apple-darwin"
      sha256 "d1bf5a601b6687c43b57e653b1c0675d9e35591e04a8999e13324aacc44a2f01"
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
