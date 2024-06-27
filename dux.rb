
# https://rubydoc.brew.sh/Formula.html

class Dux < Formula
  desc "Workspace ONE Tunnel CLI (dux)."
  homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
  version "2.1.0.2"

  @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
  #  url "https://packages.vmware.com/ws1-tunnel/cli/#{@@binary_name}"
   url "https://packages.omnissa.com/ws1-tunnel/dux/2.1.0.2/#{@@binary_name}"
  if OS.mac? && Hardware::CPU.intel?
    sha256 "372f9cfa45fb45d3d34c76d307b7cf30837cf07d28a4d4f0562f789b1cc65dc8"
  end

  if OS.mac? && Hardware::CPU.arm?
    sha256 "2b4787aaecac9197ab09c5b5c8d83ad04c913cd626b67f1cf1e2e7bb6d6e578a"
  end


  def install
      bin.install @@binary_name => "dux"
     # Create the directory structure under Cellar directory
      cellar_opt_dir = "#{HOMEBREW_PREFIX}/var/opt/vmware/dux/images"
      FileUtils.mkdir_p(cellar_opt_dir)

      dux_logs_dir = "#{HOMEBREW_PREFIX}/var/opt/vmware/dux/logs"
      FileUtils.mkdir_p(dux_logs_dir)
      ohai "Successfully installed dux!"

  end

  test do
    system "#{bin}/dux version"
  end
end
