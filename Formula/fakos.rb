# Formula/fakos.rb
class Fakos < Formula
  desc "A CLI tool for fakos"
  homepage "https://github.com/koithos/fakos"
  version "v0.0.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/fakos/releases/download/v0.0.1/fakos-x86_64-apple-darwin"
      sha256 "934b6f001770bf0ef9d35431b50ab77ed1a1c003617b1bfc40746d780e3358d1"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/fakos/releases/download/v0.0.1/fakos-aarch64-apple-darwin"
      sha256 "5e6db9ef36ec46a414033b41235e093295a69584dd03cecaca5d2a9eb4df59e5"
    end
  end

  def install
    if Hardware::CPU.intel?
      bin.install "fakos-x86_64-apple-darwin" => "fakos"
    elsif Hardware::CPU.arm?
      bin.install "fakos-aarch64-apple-darwin" => "fakos"
    end
  end

  test do
    system "#{bin}/fakos", "--version"
  end
end
