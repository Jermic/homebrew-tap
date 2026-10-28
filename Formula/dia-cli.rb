class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.7.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.7.0/dia-cli_0.7.0_darwin_arm64.tar.gz"
    sha256 "5cef790e9c9f19b98d9374e3ffb2b5957c735a992d40d01c9eaf2d58d93db67f"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.7.0/dia-cli_0.7.0_darwin_amd64.tar.gz"
    sha256 "b1a0a86f8edee1a0972c600467d5b5b31f4d043fe5ed7fd4cbefed2c37106161"
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
