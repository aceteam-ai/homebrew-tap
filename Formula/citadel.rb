# typed: false
# frozen_string_literal: true

# Homebrew formula for Citadel CLI
# Install with: brew install aceteam-ai/tap/citadel
class Citadel < Formula
  desc "CLI agent for the AceTeam Sovereign Compute Fabric"
  homepage "https://aceteam.ai"
  license "Apache-2.0"
  version "2.126.0"

  on_macos do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_arm64.tar.gz"
      sha256 "1927e76191df94446635ecf687c1623f514a54836cd6fda2b21d2c6e6a7ba4ed"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_amd64.tar.gz"
      sha256 "9905305069d6b2a6b56e9e8c41c7ca216694fe9b7dc64f5e4356005527f14fdd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_arm64.tar.gz"
      sha256 "d17f1c2a72377e686945b0a54161b176ebb13387eb2a57738b63b8b20a0c0ae2"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_amd64.tar.gz"
      sha256 "92c72f2ba07bd1371cc5ede5fa9241b93099cfcd8311829bd07cdc00736e37c3"
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
