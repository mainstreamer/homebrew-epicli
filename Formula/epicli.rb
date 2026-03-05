class Epicli < Formula
  desc "Shell environment manager — shortcuts, configs, and dev tools"
  homepage "https://github.com/mainstreamer/config"
  url "https://github.com/mainstreamer/config/releases/download/v3.4.13/epicli-3.4.13.tar.gz"
  sha256 "152508db30e3469bfd05ce6de2ab059c09ab933f8652762a733d73a3d755416b"
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
