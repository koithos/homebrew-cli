# Formula/fakos.rb
class Fakos < Formula
  desc "A CLI tool for fakos"
  homepage "https://github.com/koithos/fakos"
  version "v0.0.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/fakos/releases/download/v0.0.2/fakos-x86_64-apple-darwin"
      sha256 "edc7b542a835cc968bf5fadfb9331bbac9d0ed2518772ec96e7f6a48e5c07a71"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/fakos/releases/download/v0.0.2/fakos-aarch64-apple-darwin"
      sha256 "d7372ad834bc87f86881c385f9c5f75e8240e16c72e0fb99f7e3a0d01419d9f8"
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
