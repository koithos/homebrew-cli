# Formula/kimspect.rb
class Kimspect < Formula
  desc "A CLI tool for kimspect"
  homepage "https://github.com/koithos/kimspect"
  version "v0.0.42"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.42/kimspect-x86_64-apple-darwin"
      sha256 "b3a20170bac84c9b98e9faaa5e9631764e0dcc7b26c0d1ec228291743bcdc73f"
    end
    if Hardware::CPU.arm?
      url "https://github.com/koithos/kimspect/releases/download/v0.0.42/kimspect-aarch64-apple-darwin"
      sha256 "1a65ee8c255df5b774ed59d9fe3895f00eacf7f9d31f70fc3549ce1db4a05ee2"
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
