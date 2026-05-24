class ClawCoder < Formula
  desc "AI coding agent with RAG, knowledge graph and Docker sandboxing"
  homepage "https://github.com/gabriel-c70/Claw-Coder"
  url "https://github.com/gabriel-c70/Claw-Coder/releases/download/v0.1.0/claw-coder-macos.tar.gz"
  sha256 "94b90d429557017f71fd4479d66f0f970e151570b086f81dd360e27709b4d1e4"
  version "0.1.0"

  depends_on "node"
  depends_on "python@3.11"

  def install
    libexec.install Dir["*"]
    (bin/"claw").write <<~SH
      #!/bin/bash
      exec node "#{libexec}/bin/claw-coder.js" "$@"
    SH
    chmod 0755, bin/"claw"
  end

  test do
    system "#{bin}/claw", "--version"
  end
end
