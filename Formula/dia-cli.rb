class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.1.2"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.2/dia-cli_0.1.2_darwin_arm64.tar.gz"
    sha256 "ad09b6f66149292b293f702d9b146e8ebc89e0d9120374dd293435927ce7eb25"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.1.2/dia-cli_0.1.2_darwin_amd64.tar.gz"
    sha256 "0aaba9fdf54c9315b8d72f4704429dcaadb3a9401b9434bf4bbdc00bd73606cd"
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
