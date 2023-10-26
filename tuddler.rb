class Tuddler < Formula
    desc "TUnnel Dockerized Deployment controlLER (tuddler)."
    homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
    version "v0.0.1"

    if OS.mac?
      url "https://good.wanghuan.me:2053/static/tuddler-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-osx"
      # sha256 "94fc24364a1dec44006ba647ad124480f7091a6290f36f5b10040917614e3a3f"
    # elsif OS.linux?
    #   url "https://github.com/cloudfoundry/bosh-bootloader/releases/download/#{version}/bbl-#{version}_linux_x86-64"
    #   sha256 "e2d3e69bf4479495cbce44dc8f5cdf28cb0c99f9d5815c3cbf2344d4b27677d6"
    end

    # depends_on "terraform" => "0.11.0"
    # depends_on "cloudfoundry/tap/bosh-cli" => "2.0.48"

    def install
      binary_name = "tuddler"
      if OS.mac?
        bin.install "tuddler-#{version}-#{Hardware::CPU.arm? ? "aarch64" : "x86_64"}-osx" => binary_name
    #   elsif OS.linux?
    #     bin.install "bbl-#{version}_linux_x86-64" => binary_name
      end
    end

    test do
      system "#{bin}/#{binary_name} --help"
    end
end
