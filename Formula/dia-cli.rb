class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.6.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.6.0/dia-cli_0.6.0_darwin_arm64.tar.gz"
    sha256 "5a2dc40697b40e0e78f14a1ce7a93e4161f9ab05a7a75ea60df61c652d726ebc"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.6.0/dia-cli_0.6.0_darwin_amd64.tar.gz"
    sha256 "59692655ebad943f1f93d3cd45d0c9d25716386819d668ab57b7f02dcd95de2d"
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
