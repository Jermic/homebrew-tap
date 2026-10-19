class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.4.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.0/dia-cli_0.4.0_darwin_arm64.tar.gz"
    sha256 "18f24f7af983996f823349794c55f65b16461b24ee56de94cdc15d959489d7b5"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.4.0/dia-cli_0.4.0_darwin_amd64.tar.gz"
    sha256 "9ddb8a0f949917ba560de46cfe660f433e0247dc873beba727fe397f202ef9c2"
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
