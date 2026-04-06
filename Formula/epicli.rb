class Epicli < Formula
  desc "Shell environment manager — shortcuts, configs, and dev tools"
  homepage "https://github.com/mainstreamer/config"
  url "https://github.com/mainstreamer/config/releases/download/v3.4.17/epicli-3.4.17.tar.gz"
  sha256 "40fce8ad65b75e3d3e0a50f136a97d529ac6d9d4418302a24c251c02172a6205"
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
