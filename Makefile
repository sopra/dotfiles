BREW_PATH=/opt/homebrew/bin/brew
DOTFILES_DIR=$(shell pwd)
HOME_DIR=$(HOME)

.PHONY: help setup install-homebrew install-xcode-cli install-dotfiles install-zsh install-bash install-git install-vim install-editorconfig uninstall

# デフォルトターゲット
help:
	@echo "Dotfiles Makefile"
	@echo ""
	@echo "Available targets:"
	@echo "  make setup              - Complete setup (Homebrew + dotfiles)"
	@echo "  make install-dotfiles   - Install all dotfiles"
	@echo "  make install-zsh        - Install .zshrc"
	@echo "  make install-bash       - Install .bashrc"
	@echo "  make install-git        - Install .gitconfig and .gitignore_global"
	@echo "  make install-vim        - Install .vimrc"
	@echo "  make install-editorconfig - Install .editorconfig"
	@echo "  make uninstall          - Remove all symlinks"
	@echo "  make install-homebrew   - Install Homebrew (macOS only)"
	@echo "  make install-xcode-cli  - Install Xcode Command Line Tools"

# 完全セットアップ
setup: install-homebrew install-dotfiles
	@echo "✓ Setup complete!"
	@echo "Please restart your shell or run: source ~/.zshrc (or ~/.bashrc)"

# すべてのdotfilesをインストール
install-dotfiles: install-zsh install-bash install-git install-vim install-editorconfig
	@echo "✓ All dotfiles installed!"

# Zshのインストール
install-zsh:
	@echo "Installing .zshrc..."
	@ln -sf $(DOTFILES_DIR)/.zshrc $(HOME_DIR)/.zshrc
	@echo "✓ .zshrc installed"

# Bashのインストール
install-bash:
	@echo "Installing .bashrc..."
	@ln -sf $(DOTFILES_DIR)/.bashrc $(HOME_DIR)/.bashrc
	@echo "✓ .bashrc installed"

# Git設定のインストール
install-git:
	@echo "Installing .gitconfig and .gitignore_global..."
	@ln -sf $(DOTFILES_DIR)/.gitconfig $(HOME_DIR)/.gitconfig
	@ln -sf $(DOTFILES_DIR)/.gitignore_global $(HOME_DIR)/.gitignore_global
	@echo "✓ Git configuration installed"
	@echo "⚠ Don't forget to set your Git user name and email in ~/.gitconfig.local"

# Vimのインストール
install-vim:
	@echo "Installing .vimrc..."
	@ln -sf $(DOTFILES_DIR)/.vimrc $(HOME_DIR)/.vimrc
	@echo "✓ .vimrc installed"

# EditorConfigのインストール
install-editorconfig:
	@echo "Installing .editorconfig..."
	@ln -sf $(DOTFILES_DIR)/.editorconfig $(HOME_DIR)/.editorconfig
	@echo "✓ .editorconfig installed"

# アンインストール
uninstall:
	@echo "Removing dotfiles symlinks..."
	@rm -f $(HOME_DIR)/.zshrc
	@rm -f $(HOME_DIR)/.bashrc
	@rm -f $(HOME_DIR)/.gitconfig
	@rm -f $(HOME_DIR)/.gitignore_global
	@rm -f $(HOME_DIR)/.vimrc
	@rm -f $(HOME_DIR)/.editorconfig
	@echo "✓ Dotfiles uninstalled"

# Homebrewのインストール
install-homebrew:
ifneq ("$(wildcard $(BREW_PATH))", "$(shell which brew)")
	@echo "Installing Homebrew..."
	/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	@echo "✓ Homebrew installed"
else
	@echo "✓ Homebrew is already installed"
endif

# Xcode CLIのインストール
install-xcode-cli:
	@echo "Installing Xcode Command Line Tools..."
	xcode-select --install
