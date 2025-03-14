# https://rubydoc.brew.sh/Formula.html

class DuxAT22 < Formula
    desc "Workspace ONE Tunnel CLI (dux)."
    homepage "https://www.omnissa.com/products/workspace-one-tunnel/"
    version "2.2"
  
    @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"
    #url will be updated post upload to packages.omnissa.com. The following line is a placeholder
     url "https://packages.omnissa.com/ws1-tunnel/dux/2.2.0.247/#{@@binary_name}"
     
    # If you wish to use a binary from local file system
    #url "file://<file_path>/#{@@binary_name}"

    # Replace the following with the shasum caluclated with shasum -a 256 <binary>
    # Following lines are placeholders
    if OS.mac? && Hardware::CPU.intel?
      sha256 "8febc035f4a27b8db953b58d6afe13716e962422b9159e1fb49358afbc30777f"
    end
  
    if OS.mac? && Hardware::CPU.arm?
      sha256 "182303946e64f61ea2ddb5953de6716b0ef4333764f7f3a8d2ad69d5af335cf9"
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
