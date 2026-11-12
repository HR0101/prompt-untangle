# Prompt Untangle (開発完全特化・指示の型100選 絞り込みナビゲーター Pro)

「AIに開発を頼む指示の型 100選」を完全内蔵した、開発完全特化型の対話式要件定義＆成果物生成スキルです。

「AIに開発を頼みたいけれど、どこをどのように頼めばいいかわからない」状態からスタートし、AIがユーザーの前回の回答を深く咀嚼して次の質問をその場で自律考案。外枠から核心へとどんどん絞り込んでいきます。

さらに、リポジトリ自動先読み、UIワイヤーフレーム自動描画、セキュリティ事前監査、4つの出力形式（プロンプト／設計書.md／GitHub Issues等）を標準搭載しています。

Claude、Codex (OpenAI / Cursor)、Gemini (Antigravity / Gemini CLI) の3大プラットフォームに対応しています。

---

## インストール方法 (Installation)

### 方法1: クイック自動インストール (推奨)

ターミナルで以下のコマンドを実行すると、Gemini / Antigravity および Claude Code への設定が一括で完了します：

```bash
curl -fsSL https://raw.githubusercontent.com/HR0101/prompt-untangle/main/scripts/install.sh | bash
```

---

### 方法2: ツール別の手動インストール

#### 1. Google Antigravity / Gemini CLI に導入する場合
スキルディレクトリに本リポジトリを直接クローンします：

```bash
mkdir -p ~/.gemini/skills
git clone https://github.com/HR0101/prompt-untangle.git ~/.gemini/skills/prompt-untangle
```

- **使い方**:
  - Antigravity チャットまたは Gemini CLI 上で、`/prompt-untangle` と入力するか、「開発の要件を整理して」「AIに開発を頼みたい」と話しかけるだけで自動起動します。

---

#### 2. Claude (Claude Code / Claude.ai) に導入する場合

- **Claude Code (ターミナルCLI) のグローバルコマンドとして追加**:
  ```bash
  mkdir -p ~/.claude/commands
  curl -fsSL https://raw.githubusercontent.com/HR0101/prompt-untangle/main/claude/.claude/commands/untangle.md -o ~/.claude/commands/untangle.md
  ```
  ターミナルで `claude` 起動後、`/untangle` で即座に対話型ヒアリングが開始されます。

- **特定プロジェクトに組み込む場合**:
  リポジトリ内の `claude/CLAUDE.md` を自身のプロジェクトルートに配置します：
  ```bash
  cp -r /path/to/prompt-untangle/claude/.claude ./
  cp /path/to/prompt-untangle/claude/CLAUDE.md ./
  ```

- **Claude.ai (Web / Desktop)**:
  `claude/prompt-untangle.md` の内容をコピーし、Projects の「Project Instructions」またはチャットの先頭プロンプトに貼り付けて使用します。

---

#### 3. Cursor / VSCode / GitHub Copilot に導入する場合

- **プロジェクトルールとして追加 (推奨)**:
  エージェント標準仕様である `AGENTS.md` をプロジェクトルートに配置します：
  ```bash
  cp /path/to/prompt-untangle/codex/AGENTS.md ./
  ```
  Cursor や Copilot が自動的にこのルールを先読みし、対話型絞り込みモードで動作します。

- **.cursorrules に組み込む場合**:
  ```bash
  cat /path/to/prompt-untangle/codex/prompt-untangle.md >> .cursorrules
  ```

---

#### 4. ChatGPT (GPT-4o) / OpenAI Custom GPTs に導入する場合
`codex/prompt-untangle.md` の内容をコピーし、ChatGPT の「Custom Instructions（カスタム指示）」または GPTs の「Instructions」に貼り付けます。

---

#### 5. 単発のWebチャットで即座に使いたい場合 (Universal)
`universal/UNIVERSAL_PROMPT.md` の内容をコピーして、任意のチャット画面に貼り付けるだけで、即座にヒアリングが開始されます。

---

## 4大プロフェッショナル機能

1. **リポジトリ自動先読みスキャン (Auto-Context Pre-Scan)**
  - `package.json`, `pyproject.toml`, `Cargo.toml` 等を自動検知し、既存スタックに関する質問をスマートに省略。
2. **UIワイヤーフレーム自動描画 (ASCII/Mermaid Wireframe Preview)**
  - Webやアプリ、CLIの画面開発では、AIがASCIIアートで画面レイアウトを事前描画し、見た目のズレを撲滅。
3. **セキュリティ & リスク事前監査 (Security & Risk Advisory)**
  - 最終出力時に、インジェクション、認証バイパス、レート制限、パフォーマンスリスクへの対策アドバイザリを自動添付。
4. **GitHub Issues / PR分割チケット形式の出力サポート**
  - 設計書やプロンプトだけでなく、GitHubにそのままコピペ登録できるIssue集＋PRテンプレートでの出力に対応。

---

## 4枚の画像（指示の型100選）と「頼み方の悩み」の対応表

| パート | テーマ | 収録項目 (No) | 「どこを頼めばいいかわからない」時の役割 |
|---|---|---|---|
| **第2部** | **要件と仕様を書く** | 026〜050 | 「誰のために何を作るか・どんな機能が必要かわからない」を解決 (ペルソナ, ユーザーストーリー, MVP, 制約条件, 画面遷移図) |
| **第3部** | **進め方と作業分割** | 051〜075 | 「AIにどんな順序で作業させたらいいかわからない」を解決 (仕様駆動, TDD, 実装計画, タスク分割, プロトタイプ, AGENTS.md) |
| **第1部** | **完成の基準を決める** | 001〜025 | 「何ができたら完成か・例外やエッジケースの決め方がわからない」を解決 (受入条件, 入出力例, 異常系, 境界値, バリデーション, 空状態) |
| **第4部** | **確かめ方と直し方** | 076〜100 | 「不具合・バグの直し方やテストのさせ方がわからない」を解決 (再現手順, エラーログ, 切り分け, 単体テスト, E2E, 受入テスト) |

※ 全100項目の完全カタログは [`references/patterns-100.md`](references/patterns-100.md) を参照。

---

## どんどん絞り込む4段階の対話フロー

```
[Step 0: 既存環境の自動先読みスキャン]
   カレント環境の構成ファイルから技術スタックを自動認識し、質問を省略
         │
         ▼
[Step 1: 開発フェーズの絞り込み]
   今の困りごとは「要件仕様[1]」か「作業順[2]」か「詳細仕様・完成基準[3]」か「バグ・動作確認[4]」か？
         │
         ▼
[Step 2: コアスコープと技術制約の絞り込み]
   対象システム、言語・フレームワーク、MVP（核）、触ってはいけない範囲を特定
         │
         ▼
[Step 3: 細部の振る舞い・エッジケース & UIワイヤーフレームの絞り込み]
   ・入出力例、異常系、境界値、空データ時のルールをピンポイントで確定
   ・画面開発の場合はASCIIアートでレイアウトを提示
         │
         ▼
[Step 4: 出力形式の選択 & 成果物生成 ＋ セキュリティリスク監査]
   希望形式で成果物を出力し、末尾にリスク監査アドバイザリを添付
```

---

## 選べる4つの出力形式（Step 4）

- **[形式A] 次工程のAIにそのまま貼る『超高精度 実行指示プロンプト』**
  *(Claude Code, Codex, Geminiに貼り付けて即座にコード実装させたい場合)*
- **[形式B] リポジトリ保存用の『設計書・仕様書・計画書 (SPEC.md / PLAN.md)』**
  *(チーム共有やドキュメント保存用。構造化されたMarkdownとして出力・保存)*
- **[形式C] 両方（設計書.md ＋ 実行指示プロンプト）** (推奨)
  *(仕様を固めるドキュメントと、それを動かすプロンプトの両方が手に入る完全版)*
- **[形式D] GitHub Issues & PR分割チケット形式**
  *(GitHubにそのまま登録できるIssue集＋PRテンプレート＋アトミックコミット計画)*

---

## ディレクトリ構成

```
prompt-untangle/
├── README.md                      # 本ドキュメント
├── SKILL.md                       # Antigravity / Gemini CLI 標準スキル定義（Pro版）
├── scripts/
│   └── install.sh                 # 自動インストールシェルスクリプト
├── references/
│   └── patterns-100.md            # 指示の型100選 完全リファレンス (001〜100)
├── gemini/
│   └── SKILL.md                   # Gemini CLI / Antigravity用スキルファイル
├── claude/
│   ├── CLAUDE.md                  # Claude Code用プロジェクト設定
│   ├── prompt-untangle.md         # Claude.ai / Desktop プロジェクト用プロンプト
│   └── .claude/commands/
│       └── untangle.md            # Claude Code カスタムコマンド (/untangle)
├── codex/
│   ├── AGENTS.md                  # OpenAI Codex / Cursor用 エージェント規約 (型#68)
│   └── prompt-untangle.md         # ChatGPT / OpenAI Custom Instructions用
└── universal/
    └── UNIVERSAL_PROMPT.md        # どんなAIチャットにもコピペで使えるPro版プロンプト
```
