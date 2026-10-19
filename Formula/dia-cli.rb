class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.2.3"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.3/dia-cli_0.2.3_darwin_arm64.tar.gz"
    sha256 "845a3053546da64494ae70faf66d43fae2baaa046915ddc9dd03f8f885e936d1"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.3/dia-cli_0.2.3_darwin_amd64.tar.gz"
    sha256 "a320e3e0f1b3ae0c41b79336b812bab3b5aecb4293cfa8849243b18a03574ffd"
  end

  def install
    bin.install "dia"
    prefix.install "LICENSE"
    zsh_completion.install "_dia"
  end

  test do
    assert_match "dia #{version}", shell_output("#{bin}/dia --version")
    assert_match "dia <command>", shell_output("#{bin}/dia help")
    assert_path_exists zsh_completion/"_dia"
  end
end
