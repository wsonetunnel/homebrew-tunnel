
# https://rubydoc.brew.sh/Formula.html

class Tuddler < Formula
  desc "TUnnel Dockerized Deployment controlLER (tuddler)."
  homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
  version "1.0.0"

  @@binary_name="tuddler-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
  url "https://packages.vmware.com/ws1-tunnel/cli/#{@@binary_name}"

  if OS.mac? && Hardware::CPU.intel?
    sha256 "efd3d0a3412bcbcb40eef72430424cc5f11508c0ab972af2f5ba77a27f5816a6"
  end

  if OS.mac? && Hardware::CPU.arm?
    sha256 "cdb6f05b430b5d000ea721017cfde826c0744ca4fb14f2294c8c36188478585a"
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
