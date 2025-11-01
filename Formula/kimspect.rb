# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.36"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.36/kimspect-x86_64-apple-darwin"
      sha256 "b899c14c48703ebc16fcf9ed2f877442f2e97c10cceb331091b9a4af87dde84d"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.36/kimspect-aarch64-apple-darwin"
      sha256 "ade5ee65f94315a472c74206fcf9849bd97e8a4ff6edbb89f609452ce98f1807"
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
