# claw-coder package definitions

Install [Claw Coder](https://github.com/gabriel-c70/Claw-Coder) via a package manager.

## macOS / Linux (Homebrew)

```sh
brew tap gabriel-c70/claw-coder
brew install claw-coder
claw setup   # one-time: installs the Python dependencies into the bundled venv
```

## Windows (Scoop)

This repo doubles as a [Scoop](https://scoop.sh) bucket (manifests live in `bucket/`).

```powershell
scoop bucket add claw https://github.com/gabriel-c70/homebrew-claw-coder
scoop install claw-coder
claw setup   # one-time: installs the Python dependencies into the bundled venv
```

Both install the `claw` command. The Scoop manifest depends on `nodejs` and
`python` and creates a virtualenv under the install dir for the bundled Python
agents.
