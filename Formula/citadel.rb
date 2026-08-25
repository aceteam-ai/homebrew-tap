# typed: false
# frozen_string_literal: true

# Homebrew formula for Citadel CLI
# Install with: brew install aceteam-ai/tap/citadel
class Citadel < Formula
  desc "CLI agent for the AceTeam Sovereign Compute Fabric"
  homepage "https://aceteam.ai"
  license "Apache-2.0"
  version "2.112.0"

  on_macos do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_arm64.tar.gz"
      sha256 "4f320d21e0ed220d2de741620105f645ac61ac77aca7533ce36290802bee5b4a"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_darwin_amd64.tar.gz"
      sha256 "57dac8cf18c46736c5a40e5289437a4e2fea6bc2c354cf35d0c549881fff05cd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_arm64.tar.gz"
      sha256 "df3d2ed5f534a08e9d97eecd54a30d85e0dc2dc2451d9e57ef54a70de418df9e"
    end
    on_intel do
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v#{version}/citadel_v#{version}_linux_amd64.tar.gz"
      sha256 "babd6c74403dbc2f3cb627634071909374401c582bed117651e3c527484718ea"
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
