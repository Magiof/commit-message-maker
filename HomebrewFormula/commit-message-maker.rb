class CommitMessageMaker < Formula
  desc "LLM-based Git commit message suggester and commit helper"
  homepage "https://github.com/YOUR_GITHUB_USERNAME/commit-message-maker"
  url "https://github.com/YOUR_GITHUB_USERNAME/commit-message-maker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "REPLACE_WITH_REAL_SHA256"
  license "MIT"
  version "0.1.0"

  def install
    bin.install "bin/commit-maker"
  end

  test do
    assert_match "commit-maker", shell_output("#{bin}/commit-maker -h")
  end
end


