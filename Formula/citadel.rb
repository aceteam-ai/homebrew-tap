# typed: false
# frozen_string_literal: true

# Homebrew formula for Citadel CLI
# Install with: brew install aceteam-ai/tap/citadel
class Citadel < Formula
  desc "CLI agent for the AceTeam Sovereign Compute Fabric"
  homepage "https://aceteam.ai"
  license "Apache-2.0"
  version "2.221.0"

  on_macos do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_arm64.tar.gz"
      sha256 "9a3436f7bcbe23aae93e3d41d2cb48e622efabef3dfbc35aedde65ea00a9546f"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_amd64.tar.gz"
      sha256 "f5ed8f3682618b39435909a4ab16fe4362a736851004c6fe9b98e4f3f04e0376"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_arm64.tar.gz"
      sha256 "75b890a96f563ccfbc8bb50f758fe399f05fa1396d74b3303dad2db781d7f056"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_amd64.tar.gz"
      sha256 "2a05a87305028c5f69c3c17633ecbe637c14cc8d47ce25e863a51e2dd10cfdd9"
    end
  end

  def install
    bin.install "citadel"
    man1.install "citadel.1" if File.exist?("citadel.1")
  end

  test do
    assert_match "citadel version", shell_output("#{bin}/citadel version")
  end
end
