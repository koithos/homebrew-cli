# Formula/kimspect.rb
class kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.40"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.40/kimspect-x86_64-apple-darwin"
      sha256 "a93651fc31475af8fa6345b902a3748a6500f7e724cfd7de78480affaf923d86"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.40/kimspect-aarch64-apple-darwin"
      sha256 "3658675f80721787cf42ae0b9eabe97ae89c1eb2f0c833e5c59a891390f661fa"
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
