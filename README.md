# 🔥 flowgo

**flowgo** is an internal CLI tool for FueGo developers — automating dev workflows like creating Git branches from Notion tickets and opening GitHub URLs.

> Lean & Fast tooling for FueGo developers 🚀

## 📦 Features

- `flowgo branch DEV-123` — Create a Git branch from a Notion task (and move it to "Doing")
- `flowgo open` — Open the current GitHub branch in your browser
- `flowgo init` — Set up your local config interactively
- `flowgo update` — Upgrade to the latest version
- Configurable via `~/.flowgo/config.yaml`

## Tech Stack

- Go
- Cobra CLI
- Notion API
- GitHub + Make + YAML

## ⚙️ Installation

### 🧩 One-line install (recommended)

```bash
curl -sSfL https://raw.githubusercontent.com/fuegoers/flowgo/main/install.sh | sh
```

### With Go

```bash
make install
```

Make sure `$HOME/go/bin` is in your `$PATH`

## 📦 Updating

```bash
flowgo update
```

## ⚙️ Configuration

The config file is required to use flowgo with Notion.

### 📥 Option 1 — Automatic (recommended)

```bash
flowgo init
```

This will:

- Ask for your Notion API Key and Database ID
- Create `~/.flowgo/config.yaml` for you

### ✍️ Option 2 — Manual

```bash
mkdir -p ~/.flowgo
nano ~/.flowgo/config.yaml
```

Paste this:

```yaml
notion_api_key: "your_notion_secret_here"
notion_database_id: "your_notion_database_id"
```

## Development

```bash
make build       # Build binary locally
make run         # Run with args like CMD="branch DEV-123"
make clean       # Clean build artifacts
make snapshot    # Build binaries locally via GoReleaser
make release     # Publish a version (requires VERSION + token)
```
