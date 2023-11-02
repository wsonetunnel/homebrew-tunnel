
# https://rubydoc.brew.sh/Formula.html

class Tuddler < Formula
  desc "TUnnel Dockerized Deployment controlLER (tuddler)."
  homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
  version "1.0.0"

  @@binary_name="tuddler-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
  url "https://packages.vmware.com/ws1-tunnel/cli/#{@@binary_name}"

  if OS.mac? && Hardware::CPU.intel?
    sha256 "a29c69ef1230751d3d78d2b225902f922fc44056a42488c9f5b9bda1d6f12735"
  end

  if OS.mac? && Hardware::CPU.arm?
    sha256 "623f5a87756d5d97013e99a3dcba7c2f9a25d1024bb201ac0bdf06a0d15f2c4b"
  end

  if OS.linux? && Hardware::CPU.intel?
    sha256 "70d22c969a668219b74cc59100ad2726f459d48b89551d64945d6f049ad73d60"
  end

  if OS.linux? && Hardware::CPU.arm?
    sha256 "2995c52c0d6083af8007625ece6495d2fcbc9c583d88861b6ce8bc4d5e0ee72f"
  end

  def install
      bin.install @@binary_name => "tuddler"
  end

  test do
    system "#{bin}/tuddler version"
  end
end
