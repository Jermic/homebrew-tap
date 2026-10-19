class DiaCli < Formula
  desc "Control Dia tabs, windows, and profiles from the terminal"
  homepage "https://github.com/Jermic/dia-cli"
  version "0.2.1"
  license "MIT"
  depends_on :macos

  on_arm do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.1/dia-cli_0.2.1_darwin_arm64.tar.gz"
    sha256 "eb01f429313de1eca265b90d5a9fece3d53cea51e488245a2fd19868c5ec3a62"
  end

  on_intel do
    url "https://github.com/Jermic/dia-cli/releases/download/v0.2.1/dia-cli_0.2.1_darwin_amd64.tar.gz"
    sha256 "cbc95de0bb7a005aa6aba92996e3e2e853f1538cededc464e20c3730672c3c68"
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
