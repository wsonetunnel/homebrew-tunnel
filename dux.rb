# https://rubydoc.brew.sh/Formula.html

class Dux < Formula
    desc "Workspace ONE Tunnel CLI (dux)."
    homepage "https://www.omnissa.com/products/workspace-one-tunnel/"
    version "2.3"
  
    @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"

    url "https://packages.omnissa.com/ws1-tunnel/dux/2.3.0.405/#{@@binary_name}"
     
    # Replace the following with the shasum calculated with shasum -a 256 <binary>
    # Following lines are placeholders
    if OS.mac? && Hardware::CPU.intel?
      sha256 "2f954cd16943b7fa8461283af5c729ab0f6f9a7af9a5a2021a9d7af5083eca49"
    end
  
    if OS.mac? && Hardware::CPU.arm?
      sha256 "8412e9246e54505bbdee4f347ceb88ae21e59e70b32b69a1a3a9194fb45df908"
    end
  
  
    def install
        # Define directory paths
        vmware_dir = "#{HOMEBREW_PREFIX}/var/opt/vmware"
        omnissa_dir = "#{HOMEBREW_PREFIX}/var/opt/omnissa"

         # Check if the vmware directory exists and rename it to omnissa
        if Dir.exist?(vmware_dir)
            ohai "Upgrading: Renaming #{vmware_dir} to #{omnissa_dir}"
            mv vmware_dir, omnissa_dir
        else
            ohai "Fresh install: Creating #{omnissa_dir}"
            mkdir_p omnissa_dir
        end
        bin.install @@binary_name => "dux"
       # Create the directory structure under Cellar directory
        cellar_opt_dir = "#{HOMEBREW_PREFIX}/var/opt/omnissa/dux/images"
        FileUtils.mkdir_p(cellar_opt_dir)
  
        dux_logs_dir = "#{HOMEBREW_PREFIX}/var/opt/omnissa/dux/logs"
        FileUtils.mkdir_p(dux_logs_dir)
        ohai "Successfully installed dux!"
  
    end
  
    test do
      system "#{bin}/dux version"
    end
  end
