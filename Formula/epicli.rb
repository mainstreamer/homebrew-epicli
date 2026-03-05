class Epicli < Formula
  desc "Shell environment manager — shortcuts, configs, and dev tools"
  homepage "https://github.com/mainstreamer/config"
  url "https://github.com/mainstreamer/config/releases/download/v3.4.12/epicli-3.4.12.tar.gz"
  sha256 "ac6a329463e257f07689cf08772d589b562d7e59f0687982b1eb53e85423fb1c"
  license "MIT"

  def install
    libexec.install Dir["*"]
    (bin/"epicli").write <<~EOS
      #!/usr/bin/env bash
      export DOTFILES_TARGET="#{libexec}"
      exec bash "#{libexec}/install.sh" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Run 'epicli' to complete setup (install deps, create symlinks).
      Run 'epicli help' for available commands.
    EOS
  end
end
