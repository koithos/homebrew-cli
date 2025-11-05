# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.37"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.37/kimspect-x86_64-apple-darwin"
      sha256 "ebbbe2c7d6067774d43997624a3e19ddeed71493af6ff5a37e4eee2085eca1a7"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.37/kimspect-aarch64-apple-darwin"
      sha256 "45cf6fc14cbe5d7b5e1925ba34872bebb14cc0116f7c5896ba6fff89bf2f49bb"
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
