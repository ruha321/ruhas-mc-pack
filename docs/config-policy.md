# config 管理方針

packwiz では `config/` 配下のファイルも配布対象にできます。ただし，すべての config を共有すると，個人設定や環境依存設定まで上書きしてしまうため，管理対象を分けます。

## 基本方針

| 分類 | 方針 | 例 |
|---|---|---|
| サーバー参加に必要な設定 | 管理する | MOD の共通動作，互換性設定，ゲーム体験に関わる設定 |
| 表示・軽量化の推奨設定 | 原則管理する | Sodium，ModernFix，FerriteCore など |
| UI の共通方針 | 必要なら管理する | Jade，EMI，JEI の表示方針 |
| キーバインド | 原則管理しない | 個人の操作感に強く依存する設定 |
| 画面・音量・言語 | 管理しない | `options.txt` など |
| ワールドデータ | 管理しない | `saves/`，`world/` |
| 実行結果 | 管理しない | `logs/`，`crash-reports/`，`screenshots/` |

## 現在入っている config の見直し候補

以下は，今後見直すとよい候補です。

### 個人設定寄りなので注意

- `config/fzzy_config/keybinds.toml`
- `config/emi.css`
- `config/jei/jei-client.ini`
- `config/iris.properties`
- `config/sodium-options.json`
- `config/jade/jade.json`

これらは共有しても動きますが，キー操作，UI 配置，シェーダー有効状態，表示位置など，プレイヤーごとの差が出やすい設定を含む可能性があります。

### サーバー側にも関係しそうなので確認

- `config/lctech-server.txt`
- `config/lightmanscurrency-server.txt`
- `config/neoforge-server.toml`
- `config/lightmanscurrency/*.json`
- `config/trades/**/*.json`

これらはサーバーのゲーム体験に関係する可能性があります。クライアントにも同じ設定が必要か，サーバーだけでよいかを確認してから運用します。

### 共有しやすい候補

- `config/ferritecore-mixin.toml`
- `config/modernfix-common.toml`
- `config/modernfix-mixins.properties`
- `config/lithium.properties`
- `config/scalablelux.properties`

軽量化・互換性寄りの設定は，共通化しても問題になりにくい傾向があります。ただし，環境依存のクラッシュ回避設定を含む場合は個別対応にします。

## config 追加時の手順

```bash
# 1. config をコピー
cp /path/to/prism-instance/.minecraft/config/example.toml config/

# 2. index.toml を更新
packwiz refresh

# 3. 差分を見る
git diff
```

## 削除・除外したい場合

packwiz 管理から外す場合は，ファイルを削除してから `packwiz refresh` を実行します。

```bash
git rm config/example.toml
packwiz refresh
```

一時ファイルや個人設定を誤って含めたくない場合は `.packwizignore` に追加します。

## 判断に迷ったとき

迷ったら，次の基準で判断します。

```text
サーバー参加に必要か？
  yes -> 管理候補
  no  -> 次へ

全員に同じUI・表示を強制したいか？
  yes -> 管理候補
  no  -> 管理しない

個人のキー操作・画面・音量・言語に関わるか？
  yes -> 管理しない
```
