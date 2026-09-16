# https://rubydoc.brew.sh/Formula.html

class DuxAT312 < Formula
    desc "Omnissa CLI - dux"
    homepage "https://www.omnissa.com/products/workspace-one-tunnel/"
    version "3.1.2"

    license <<~EOS
    Copyright © 2024-2026 Omnissa. All rights reserved. This product is protected
    by copyright and intellectual property laws in the United States and other
    countries as well as by international treaties. Omnissa products are covered by
    one or more patents listed at: https://www.omnissa.com/omnissa-patent-information/.
    Omnissa products are also covered by general and offering-specific legal terms,
    as well as the privacy and open-source software notices hosted on the Omnissa
    Legal Center at: https://www.omnissa.com/legal-center/. "Omnissa" refers to
    Omnissa, LLC, Omnissa International Unlimited Company, and/or their subsidiaries.
    EOS

  
    @@binary_name="dux-#{OS.mac? ? "darwin" : "linux"}-#{Hardware::CPU.intel? ? "amd64" : "arm64"}_#{version}"

    url "https://packages.omnissa.com/ws1-tunnel/dux/3.1.2.1076/#{@@binary_name}"
     
    # Replace the following with the shasum calculated with shasum -a 256 <binary>
    # Following lines are placeholders
    if OS.mac? && Hardware::CPU.intel?
      sha256 "91227ca786d1d0904110d02d728f57562ca1e1ba8336543cff0fa417ac1f682d"
    end
  
    if OS.mac? && Hardware::CPU.arm?
      sha256 "8f75dd96210af76c54858287ffa6984f53b1d28bfb5d0bba6c5617e432db809d"
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

        dux_certs_dir = "#{HOMEBREW_PREFIX}/var/opt/omnissa/dux/certs"
        FileUtils.mkdir_p(dux_certs_dir)


        dux_scripts_dir = "#{HOMEBREW_PREFIX}/var/opt/omnissa/dux/scripts"
        FileUtils.mkdir_p(dux_scripts_dir)
  
    end
  
    test do
      system "#{bin}/dux version"
    end
  end
