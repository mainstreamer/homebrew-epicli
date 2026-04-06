class Epicli < Formula
  desc "Shell environment manager — shortcuts, configs, and dev tools"
  homepage "https://github.com/mainstreamer/config"
  url "https://github.com/mainstreamer/config/releases/download/v3.4.16/epicli-3.4.16.tar.gz"
  sha256 "e7bfc58021d27df2a59fba933549ed79f1dfdede346bed4e79aee70c28aaf192"
  license "MIT"

  def install
    libexec.install Dir["*"]
    (bin/"epicli").write <<~EOS
      #!/usr/bin/env bash
      export EPICLI_HOMEBREW=1
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
