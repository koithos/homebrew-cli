# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.41"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.41/kimspect-x86_64-apple-darwin"
      sha256 "675b71259436437658b182fe245ec1e1f7bbf278ec0cc1d447546f9b35c6cce9"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.41/kimspect-aarch64-apple-darwin"
      sha256 "7ee9eda6bf7bb57b59523d71a42bd23067f0ec11e1078a18cdd1192fb27a295c"
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
