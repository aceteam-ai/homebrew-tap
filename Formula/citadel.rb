# typed: false
# frozen_string_literal: true

# Homebrew formula for Citadel CLI
# Install with: brew install aceteam-ai/tap/citadel
class Citadel < Formula
  desc "CLI agent for the AceTeam Sovereign Compute Fabric"
  homepage "https://aceteam.ai"
  license "Apache-2.0"
  version "2.92.0"

  on_macos do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_arm64.tar.gz"
      sha256 "76236c9097e389bfadc3e5a792beef85f7414e13f0323032cb4ad72e8ace11db"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_amd64.tar.gz"
      sha256 "719938c93612d092a9a7f65fbc6d1de355d79f39a2b25882b5e1207c9ea864dc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_arm64.tar.gz"
      sha256 "c755a5cb313a4986ddc7d9d185b200b56a8c2343f8ee5ac0227953a161e9f827"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_amd64.tar.gz"
      sha256 "aa9e05a20cdf7f86412353a30f752a5e26447d6a4a57e0cedcbf35dbc7666fd9"
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
