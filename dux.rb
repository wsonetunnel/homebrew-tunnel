
# https://rubydoc.brew.sh/Formula.html

class Dux < Formula
  desc "Workspace ONE Tunnel CLI (dux)."
  homepage "https://www.vmware.com/products/workspace-one/tunnel.html"
  version "2.0.0.2"

  @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
  #  url "https://packages.vmware.com/ws1-tunnel/cli/#{@@binary_name}"
   url "http://packages-dev.eng.vmware.com/ws1-tunnel/BETA_dux/2.0.0.2/#{@@binary_name}"
  if OS.mac? && Hardware::CPU.intel?
    sha256 "eb0c90a57f80d1a24df4bf80be9531cf52385bd0f4a36c92fcf1fc7f8815e58c"
  end

  if OS.mac? && Hardware::CPU.arm?
    sha256 "8f07eb47f9dd94d4c748362952feb2548f868154f9ad86cb530106e07893efd1"
  end


  def install
      bin.install @@binary_name => "dux"
     # Create the directory structure under Cellar directory
      cellar_opt_dir = "#{HOMEBREW_PREFIX}/var/opt/vmware/dux/images"
      FileUtils.mkdir_p(cellar_opt_dir)

      dux_logs_dir = "#{HOMEBREW_PREFIX}/var/opt/vmware/dux/logs"
      FileUtils.mkdir_p(dux_logs_dir)

  end

  test do
    system "#{bin}/dux version"
  end
end
