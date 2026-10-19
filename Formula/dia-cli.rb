class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.1.1"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.1/dia-cli_0.1.1_darwin_arm64.tar.gz"
    sha256 "29cf731d8cfe3b4e5bc9b5e39539ba45ded0874d236cfab828ab249cd607413e"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.1/dia-cli_0.1.1_darwin_amd64.tar.gz"
    sha256 "b9a96fa86ef949bfa6756bc50ec067936e2b3d125e00298f55b159adb6914b13"
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
