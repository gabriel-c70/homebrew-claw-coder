class ClawCoder < Formula
  desc "Local AI coding agent with RAG, knowledge graph and Docker sandboxing"
  homepage "https://github.com/gabriel-c70/Claw-Coder"
  url "https://github.com/gabriel-c70/Claw-Coder/releases/download/v0.1.0/claw-coder-macos.tar.gz"
  sha256 "dee6e889738b544133d5604a07e720a1c4f33abb48d13f553c2b3de7bc0ab72d"
  version "0.1.0"

  depends_on "node"
  depends_on "python@3.11"

  def install
    system "npm", "install", "--prefix", "#{libexec}", "--omit=dev",
           "--no-audit", "--no-fund"
    libexec.install Dir["*"]
    (bin/"claw").write <<~SH
      #!/bin/bash
      export CLAW_PYTHON="#{libexec}/venv/bin/python3"
      exec node "#{libexec}/bin/claw-coder.js" "$@"
    SH
    chmod 0755, bin/"claw"
  end

  test do
    system "#{bin}/claw", "--version"
  end
end
