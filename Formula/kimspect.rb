# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.43"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.43/kimspect-x86_64-apple-darwin"
      sha256 "c37cd2e507cd9d401404d032b0cd350a4c08d4ebcea1872fb0c57e55fcdeba7f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.43/kimspect-aarch64-apple-darwin"
      sha256 "b1bc4d1391612476f585002a8c227d270f9ba8c70066eda584d1f59e9289c826"
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
