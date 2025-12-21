# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.39"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.39/kimspect-x86_64-apple-darwin"
      sha256 "9342cbfd78144c0ed2611b6e9f861435e77f22026a9a942b21cc485bbfe2c35c"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.39/kimspect-aarch64-apple-darwin"
      sha256 "3adc5dfbaaac14d50a88c56f9c941c6bff48164b7d64e78b1768c46ff766aecf"
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
