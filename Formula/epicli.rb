class Epicli < Formula
  desc "Shell environment manager — shortcuts, configs, and dev tools"
  homepage "https://github.com/mainstreamer/config"
  url "https://github.com/mainstreamer/config/releases/download/v3.4.11/epicli-3.4.11.tar.gz"
  sha256 "2fc73ac303f6c8596aa180e5e1a2ac8fbbe6546379f0185706d18eb5b8398f0b"
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
