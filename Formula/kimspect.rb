# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.44"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.44/kimspect-x86_64-apple-darwin"
      sha256 "14ec7cafdeacf7a72e3fee4b04426e4484bec211719a4227ac799695895cfa8a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.44/kimspect-aarch64-apple-darwin"
      sha256 "6aa28c57045f805cded909272e4d68f9191a696bfb6037dac25e669f88564345"
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
