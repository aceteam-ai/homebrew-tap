# CLAUDE.md - Homebrew Tap

Homebrew formula repository for installing Citadel CLI on macOS.

## Overview

This is a Homebrew tap (`aceteam-ai/tap`) that distributes the Citadel CLI binary. Users install via:

```bash
brew tap aceteam-ai/tap
brew install citadel
```

## Structure

```
homebrew-tap/
├── Formula/
│   └── citadel.rb    # Homebrew formula for Citadel CLI
└── README.md
```

## Formula Update Process

When a new Citadel CLI version is released:

1. Build release binaries in citadel-cli repo (`./release.sh`)
2. Upload `.tar.gz` archives to GitHub Releases
3. Update `Formula/citadel.rb`:
   - Update `version` string
   - Update `url` fields for each architecture (darwin_arm64, darwin_amd64)
   - Update `sha256` checksums (from `shasum -a 256 <archive>`)
4. Commit and push to main

## Testing

```bash
# Test formula locally
brew install --build-from-source Formula/citadel.rb

# Verify installation
brew test citadel

# Audit formula
brew audit --strict Formula/citadel.rb
```

## Supported Platforms

- macOS ARM64 (Apple Silicon)
- macOS AMD64 (Intel)

Linux users install Citadel via the install script in citadel-cli repo.
