# Ruhas Mc Pack

NeoForge 1.21.1 向けの身内サーバー用 Minecraft MOD パックです。

このリポジトリは packwiz で管理しています。MOD 本体の jar を直接コミットするのではなく，`pack.toml`，`index.toml`，`mods/*.pw.toml`，`config/` などの宣言的な構成を Git 管理します。

## 現在の前提

- Minecraft: `1.21.1`
- Mod loader: `NeoForge 21.1.228`
- Pack format: `packwiz:1.1.0`
- Launcher: Prism Launcher 想定

## ディレクトリ構成

```text
.
├── pack.toml              # パック名，バージョン，Minecraft/NeoForge のバージョン
├── index.toml             # packwiz が管理するファイル一覧とハッシュ
├── mods/                  # MOD のメタデータ。基本は *.pw.toml
├── config/                # 共有する MOD config
├── docs/                  # 運用メモ
└── examples/              # サーバー設定例
```

## クライアントで使う流れ

### 1. packwiz のローカル配信

```bash
packwiz serve
```

通常は `http://localhost:8080/pack.toml` で配信されます。

### 2. Prism Launcher 側の Pre-launch command

Prism の対象インスタンスの Minecraft フォルダ直下に `packwiz-installer-bootstrap.jar` を置き，Custom Commands の Pre-launch command に以下を設定します。

```bash
"$INST_JAVA" -jar "$INST_MC_DIR/packwiz-installer-bootstrap.jar" "http://localhost:8080/pack.toml"
```

公開 URL に切り替えたら，最後の URL だけ差し替えます。

```bash
"$INST_JAVA" -jar "$INST_MC_DIR/packwiz-installer-bootstrap.jar" "https://example.com/pack.toml"
```

## MOD を追加する

Modrinth から追加する例です。

```bash
packwiz modrinth install <mod-slug-or-url>
packwiz refresh
```

追加後は `mods/*.pw.toml` の `side` を確認します。

```bash
grep -R -n '^side = ' mods
```

## config を追加・更新する

1. Prism で一度起動して config を生成する
2. 共有したい config だけをこのリポジトリの `config/` にコピーする
3. `packwiz refresh` を実行する
4. `git diff` で `index.toml` の変更を確認する

詳しい方針は `docs/config-policy.md` を参照してください。

## サーバー運用

サーバー側は，MOD/config の同期に packwiz を使い，`server.properties`，whitelist，OP 権限などはコンテナの環境変数で管理する方針です。

`itzg/minecraft-server` を使う場合の例は `examples/compose.yaml` と `examples/minecraft.env.example` を参照してください。

## 注意

- `packwiz-installer-bootstrap.jar` は packwiz の管理対象に含めません。Prism インスタンスの初期テンプレート側に置きます。
- `options.txt`，`servers.dat`，`saves/`，`logs/`，`crash-reports/` は配布対象にしません。
- 個人のキー設定や画面設定は，原則として packwiz で強制共有しません。
