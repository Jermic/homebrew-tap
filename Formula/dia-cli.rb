class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.2.2"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.2/dia-cli_0.2.2_darwin_arm64.tar.gz"
    sha256 "11439a5a7c38fb75467297c6891d417936a5fb19fe551998c367182319266336"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.2/dia-cli_0.2.2_darwin_amd64.tar.gz"
    sha256 "fb056cc79f3919c3e866de7d79de1d6dc2113bf8fb6aad1d37e55407beb41542"
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
