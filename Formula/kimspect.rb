# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.35"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.35/kimspect-x86_64-apple-darwin"
      sha256 "340a8e66463c1cb4f02ca1f166076db678deda6f511bf2dd60ae9f2013aad5a8"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.35/kimspect-aarch64-apple-darwin"
      sha256 "506dd2e108b6b04b02c494f27d525f1f67a0bb02ee29f9912d8d1d5611f6c532"
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
