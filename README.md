# 🔥 flowgo

**flowgo** is an internal CLI tool for FueGo developers — automating dev workflows like creating Git branches from Notion tickets and opening GitHub URLs.

> Lean & Fast tooling for FueGo developers 🚀

## 📦 Features

- `flowgo branch DEV-123` — Create a Git branch from a Notion task (and move it to "Doing")
- `flowgo open` — Open the current branch on GitHub in your browser
- Configurable via `~/.flowgo/config.yaml`
- Clean Go architecture & CLI with Cobra

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

## ⚙️ Configuration

Before using `flowgo`, create your config file:

```bash
mkdir -p ~/.flowgo
nano ~/.flowgo/config.yaml
```

Paste this inside:

```yaml
notion_api_key: "your_notion_secret_here"
notion_database_id: "your_notion_database_id"
```

## Development

### Build locally

```bash
make build
```

### Clean artifacts

```bash
make clean
```
