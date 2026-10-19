class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.1.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.0/dia-cli_0.1.0_darwin_arm64.tar.gz"
    sha256 "07384acee3bca96195fdb3398eac6902c25a95a302518c369dd85c27b9dcb8bb"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.0/dia-cli_0.1.0_darwin_amd64.tar.gz"
    sha256 "5a9cd888ba461f685f3806d74177bc0d3ebd2bf260bdc7808870c2bd6e8be158"
  end

  def install
    bin.install "dia"
    prefix.install "LICENSE"
  end

  test do
    assert_match "dia #{version}", shell_output("#{bin}/dia --version")
    assert_match "dia <command>", shell_output("#{bin}/dia help")
  end
end
