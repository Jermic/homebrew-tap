class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.2.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.0/dia-cli_0.2.0_darwin_arm64.tar.gz"
    sha256 "bc61b70009e390f701d360a9da696cce07c5befce693068a74f5c1aab46cb293"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.0/dia-cli_0.2.0_darwin_amd64.tar.gz"
    sha256 "d13a6f808ecf4c9d8327c0531f106ceb91f5ebd1d3b383beed8021fa50d17e37"
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
