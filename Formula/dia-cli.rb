class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.3.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.3.0/dia-cli_0.3.0_darwin_arm64.tar.gz"
    sha256 "538e6ded608f4c940e1b4f8320787d9558aa2d3e060ab50c998101604bae1067"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.3.0/dia-cli_0.3.0_darwin_amd64.tar.gz"
    sha256 "80e20807c5811104bad599b664a61a25802cf629dd110041652570623b5e6b22"
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
