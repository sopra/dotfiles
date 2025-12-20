# 🏠 Dotfiles

Antigravity/Gemini AI Coding に最適化されたドットファイル集です。  
Linux と macOS の両環境で利用できます。

## 📦 含まれる設定ファイル

### シェル環境
- **`.zshrc`** - Zsh設定（推奨）
  - AI支援コーディング用のエイリアスと関数
  - Git情報を含むプロンプト
  - 豊富なGitエイリアス
  - プロジェクト管理用のヘルパー関数

- **`.bashrc`** - Bash設定
  - `.zshrc`と同等の機能をBashで提供

### Git
- **`.gitconfig`** - Git設定
  - 視覚的なログ表示
  - AI向けのエイリアス（summary, today, week）
  - 色付き差分表示
  
- **`.gitignore_global`** - グローバルgitignore
  - OS、エディター、言語固有の一時ファイルを除外
  - Antigravity/Gemini固有のファイルも除外

### Gemini CLI
- **`.gemini/settings.json`** - Gemini CLI設定
  - デフォルトモデル設定（gemini-2.0-flash-exp）
  - 生成パラメータ設定
  - セーフティ設定
  - 自動承認コマンド設定
  
- **`.env.gemini.template`** - 環境変数テンプレート
  - APIキー設定用テンプレート
  - Vertex AI設定のサンプル

### Claude Code
- **`.claude/settings.json`** - Claude Code設定
  - 自動承認コマンド設定
  - 自動承認ツール設定
  
- **`.claude/CLAUDE.md`** - グローバルメモリー
  - コーディング基準
  - AI Codingワークフロー
  - 環境情報
  
- **`.env.claude.template`** - 環境変数テンプレート
  - Anthropic APIキー設定用テンプレート

### Codex CLI
- **`.codex/config.toml`** - Codex CLI設定
  - デフォルトモデル設定（o1）
  - 承認ポリシー設定
  - サンドボックス設定
  - プロファイル設定（deep-review, fast）
  
- **`.env.codex.template`** - 環境変数テンプレート
  - OpenAI APIキー設定用テンプレート

### 共通AI設定
- **`AGENTS.md`** - AIコーディングツール向け汎用ガイドライン
  - コーディング基準とベストプラクティス
  - AIコーディングワークフロー
  - Git コミット規約
  - デバッグ戦略
  - すべてのAIツール（Gemini CLI、Claude Code、Codex CLI等）から参照可能

### エディター
- **`.vimrc`** - Vim設定
  - コーディングに最適な設定
  - 便利なキーマッピング
  - ファイルタイプ別設定

- **`.editorconfig`** - EditorConfig
  - 複数のエディター間でコードスタイルを統一
  - 言語別のインデント設定

## 🚀 インストール方法

### 1. リポジトリをクローン

```bash
cd ~
git clone https://github.com/sopra/dotfiles.git ~/Devel/github.com/sopra/dotfiles
cd ~/Devel/github.com/sopra/dotfiles
```

### 2. 自動セットアップ

```bash
make setup
```

これにより以下が実行されます：
- Homebrewのインストール（macOS）
- シンボリックリンクの作成

### 3. 手動セットアップ

必要な設定ファイルをホームディレクトリにシンボリックリンクします：

```bash
# Zsh
ln -sf ~/Devel/github.com/sopra/dotfiles/.zshrc ~/.zshrc

# Bash
ln -sf ~/Devel/github.com/sopra/dotfiles/.bashrc ~/.bashrc

# Git
ln -sf ~/Devel/github.com/sopra/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/Devel/github.com/sopra/dotfiles/.gitignore_global ~/.gitignore_global

# Vim
ln -sf ~/Devel/github.com/sopra/dotfiles/.vimrc ~/.vimrc

# EditorConfig
ln -sf ~/Devel/github.com/sopra/dotfiles/.editorconfig ~/.editorconfig

# Gemini CLI
mkdir -p ~/.gemini
ln -sf ~/Devel/github.com/sopra/dotfiles/.gemini/settings.json ~/.gemini/settings.json

# Claude Code
mkdir -p ~/.claude
ln -sf ~/Devel/github.com/sopra/dotfiles/.claude/settings.json ~/.claude/settings.json
ln -sf ~/Devel/github.com/sopra/dotfiles/.claude/CLAUDE.md ~/.claude/CLAUDE.md

# Codex CLI
mkdir -p ~/.codex
ln -sf ~/Devel/github.com/sopra/dotfiles/.codex/config.toml ~/.codex/config.toml

# 環境変数ファイル（初回のみ）
cp ~/Devel/github.com/sopra/dotfiles/.env.gemini.template ~/.env
# 必要に応じて .env.claude.template や .env.codex.template の内容も追記
```

### 4. Gitユーザー情報の設定

`.gitconfig`にユーザー情報を追加するか、`~/.gitconfig.local`を作成：

```bash
cat > ~/.gitconfig.local << 'EOF'
[user]
    name = Your Name
    email = your.email@example.com
EOF
```

### 5. AI CLI ツールのAPIキー設定

`~/.env` ファイルを編集して、使用するAI CLIツールのAPIキーを設定してください：

```bash
# Gemini CLI (Google AI Studio)
# https://makersuite.google.com/app/apikey
GEMINI_API_KEY=your_gemini_api_key_here

# Claude Code (Anthropic)
# https://console.anthropic.com/
ANTHROPIC_API_KEY=your_anthropic_api_key_here

# Codex CLI (OpenAI)
# https://platform.openai.com/api-keys
OPENAI_API_KEY=your_openai_api_key_here
```

## 🎯 AI Codingに便利な機能

### エイリアス

```bash
# Git操作
gs          # git status
ga          # git add
gc          # git commit
gp          # git push
gl          # git log (グラフ表示、最新20件)
gd          # git diff

# AI向けGitコマンド
ai-commit   # 現在時刻付きで全変更をコミット
ai-status   # ステータスと最近のコミットを表示
ai-diff     # 差分を100行まで表示
```

### ヘルパー関数

```bash
# クイックコミット
qcommit "feat: add new feature"

# Git情報を表示
git-info

# プロジェクト構造を表示（AI向け）
tree-context [depth]

# 最近変更されたファイルを表示
recent-changes [days]

# 新規プロジェクト作成
new-project project-name
```

### Gitエイリアス

```bash
# ログ表示
git lg       # グラフ付きログ（見やすい）
git summary  # 最近20件の要約
git today    # 今日の作業内容
git week     # 今週の作業内容

# その他
git undo     # 最後のコミットを取り消す（変更は保持）
git changed  # 変更されたファイル一覧
```

## 🛠️ カスタマイズ

各設定ファイルは対応する`.local`ファイルで上書き可能です：

- `~/.zshrc.local` - Zsh専用のローカル設定
- `~/.bashrc.local` - Bash専用のローカル設定
- `~/.gitconfig.local` - Git専用のローカル設定
- `~/.vimrc.local` - Vim専用のローカル設定

これらのファイルは`.gitignore`に含まれているため、プライベートな設定を安全に保存できます。

## 📝 推奨される追加ツール

以下のツールをインストールすると、さらに快適になります：

```bash
# AI CLI Tools
# Gemini CLI
npm install -g @google/generative-ai-cli
# または
brew install gemini-cli

# Claude Code
npm install -g @anthropic-ai/claude-code
# または公式サイトからダウンロード

# Codex CLI
# https://openai.com/index/introducing-operator/ から入手

# macOS (Homebrew)
brew install fzf        # ファジーファインダー
brew install tree       # ディレクトリツリー表示
brew install bat        # catの改良版
brew install ripgrep    # grepの高速版
brew install exa        # lsの改良版
```

## 🌐 環境

- **対応OS**: macOS, Linux
- **対応シェル**: Zsh (推奨), Bash
- **Gitバージョン**: 2.0以上推奨

## 📄 ライセンス

MIT License

## 🤝 コントリビューション

改善提案やバグ報告は、Issueまたはプルリクエストでお願いします。

---

**Happy Coding with AI! 🚀**
