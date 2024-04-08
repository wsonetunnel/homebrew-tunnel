
# https://rubydoc.brew.sh/Formula.html

class Dux < Formula
  desc "Workspace ONE Tunnel CLI (dux)."
  homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
  version "2.0.0.3"

  @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
  #  url "https://packages.vmware.com/ws1-tunnel/cli/#{@@binary_name}"
   url "http://packages.vmware.com/ws1-tunnel/dux/2.0.0.3/#{@@binary_name}"
  if OS.mac? && Hardware::CPU.intel?
    sha256 "c81c56bde26b473bdcb6c71107590a155f5e5d4ad5880028e7beac11518e00ea"
  end

  if OS.mac? && Hardware::CPU.arm?
    sha256 "ba35642e38570ce07ea612a56334483bc83d9a1cfa8a876f8e994ffe4554b1e5"
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
