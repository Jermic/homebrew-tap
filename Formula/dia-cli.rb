class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.4.1"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.1/dia-cli_0.4.1_darwin_arm64.tar.gz"
    sha256 "a6ad1e0231a2db0d1aaf5c69e67e164c3489dd92e355579057fa8e43d3e50e70"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.1/dia-cli_0.4.1_darwin_amd64.tar.gz"
    sha256 "9ac474baf49903e62be1c684ae5ed9e96c5a452ed452048275832d80819f01d7"
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
