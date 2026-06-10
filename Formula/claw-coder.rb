class ClawCoder < Formula
  desc "Local AI coding agent with RAG, knowledge graph and Docker sandboxing"
  homepage "https://github.com/gabriel-c70/Claw-Coder"
  url "https://github.com/gabriel-c70/Claw-Coder/releases/download/v0.1.0/claw-coder-macos.tar.gz"
  sha256 "dee6e889738b544133d5604a07e720a1c4f33abb48d13f553c2b3de7bc0ab72d"

  depends_on "node"
  depends_on "python@3.11"

  def install
    libexec.install Dir["*"]

    # The bundled Python agents run in an isolated virtualenv so that
    # `claw setup` can install requirements.txt without touching the
    # system Python. CLAW_PYTHON (below) points the CLI at this interpreter.
    system Formula["python@3.11"].opt_bin/"python3.11", "-m", "venv", libexec/"venv"

    (bin/"claw").write <<~SH
      #!/bin/bash
      export CLAW_PYTHON="#{libexec}/venv/bin/python3"
      exec node "#{libexec}/bin/claw-coder.js" "$@"
    SH
    (bin/"claw").chmod 0755
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/claw --version")
  end
end
