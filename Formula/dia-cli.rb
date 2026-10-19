class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.4.2"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.2/dia-cli_0.4.2_darwin_arm64.tar.gz"
    sha256 "a1b9d0e2e8046cf31e3f849d35867f2cf2b207b3a4eb32988c2c8bc5958abafb"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.2/dia-cli_0.4.2_darwin_amd64.tar.gz"
    sha256 "0d516d04dbff9f01bf0905f9d8e5153862c527f55cdf8dea39dbcd04a57bdf34"
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
