#!/usr/bin/env bash
set -e

# Prompt Untangle Installer for Gemini / Antigravity and Claude Code

REPO_URL="https://github.com/HR0101/prompt-untangle.git"
INSTALL_DIR_GEMINI="$HOME/.gemini/skills/prompt-untangle"
INSTALL_DIR_CLAUDE="$HOME/.claude/commands"

echo "Installing Prompt Untangle..."

# 1. Install for Gemini / Antigravity
if [ -d "$HOME/.gemini" ]; then
    echo "Configuring for Gemini / Antigravity..."
    mkdir -p "$HOME/.gemini/skills"
    if [ -d "$INSTALL_DIR_GEMINI" ]; then
        echo "Updating existing installation in $INSTALL_DIR_GEMINI..."
        git -C "$INSTALL_DIR_GEMINI" pull || true
    else
        echo "Cloning repository to $INSTALL_DIR_GEMINI..."
        git clone "$REPO_URL" "$INSTALL_DIR_GEMINI"
    fi
    echo "Gemini / Antigravity installation complete."
fi

# 2. Install global slash command for Claude Code
if [ -d "$HOME/.claude" ] || command -v claude >/dev/null 2>&1; then
    echo "Configuring for Claude Code..."
    mkdir -p "$INSTALL_DIR_CLAUDE"
    if [ -f "$INSTALL_DIR_GEMINI/claude/.claude/commands/untangle.md" ]; then
        cp "$INSTALL_DIR_GEMINI/claude/.claude/commands/untangle.md" "$INSTALL_DIR_CLAUDE/untangle.md"
    else
        curl -fsSL https://raw.githubusercontent.com/HR0101/prompt-untangle/main/claude/.claude/commands/untangle.md -o "$INSTALL_DIR_CLAUDE/untangle.md"
    fi
    echo "Claude Code slash command (/untangle) installed to $INSTALL_DIR_CLAUDE."
fi

echo "Installation finished successfully."
echo "You can now use /prompt-untangle in Gemini/Antigravity or /untangle in Claude Code."
