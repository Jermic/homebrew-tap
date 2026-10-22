class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.5.0"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.5.0/dia-cli_0.5.0_darwin_arm64.tar.gz"
    sha256 "b71a60366a68d9b70a3dc60562c10c66dbd8b2f06b36dc8038352f9300d2512b"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.5.0/dia-cli_0.5.0_darwin_amd64.tar.gz"
    sha256 "da42392975f229bedd4a7ea12845d89c4f268fa306f817bec6942908213fae40"
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
