class Citadel < Formula
  desc "On-premise agent for the AceTeam Sovereign Compute Fabric"
  homepage "https://github.com/aceteam-ai/citadel-cli"
  version "1.13.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v1.13.0/citadel_v1.13.0_darwin_arm64.tar.gz"
      sha256 "21f8484c1fd69a5e0575079a7d38d855234d45caa46e488d013994858e5d8984"
    elsif Hardware::CPU.intel?
      url "https://github.com/aceteam-ai/citadel-cli/releases/download/v1.13.0/citadel_v1.13.0_darwin_amd64.tar.gz"
      sha256 "4b40f143083fb453f3356eafdf68fdabcb7165b7d25d60e4c7c6a8cd0ec222ac"
    end
  end

  def install
    bin.install "citadel"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/citadel version")
  end
end
