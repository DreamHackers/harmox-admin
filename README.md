# harmox-app
harmoxの総合リポジトリです

## privateにしておくspan
2015/04〜2017/03

## Tree

```
.
├── README.md
├── harmox-admin
├── harmox-user
└── harmox-analytics
```

|project|detail|
|:--:|:--:|
|harmox-admin|管理画面|
|harmox-admin|ユーザ画面|
|harmox-analytics|分析画面|

# ルール

## Issues
* 気になったことを乱雑でもいいのでこれでチケットを作る
* ラベル、優先度だけは何かしらつけてほしい
* 担当者、とかマイルストーンは確定していれば付ける

## 開発の流れ
1. Issuesで作成したものを元に優先度を加味し開発を進める
* 対応中のチケットには「対応中」とコメントを残す。さらに対応時に発生したことなどをそこにコメント残しておく
* Issuesに#の番号が隣についているので、それをコミットする時に付与すること

2. 設定ファイルを保存する時
* centos/configに保存して下さい
* `scp -i ~/key/hogehoge.pem -P 22 ec2-user@XX.XX.XX.XX:~/app/hogehoge.conf ./`

## ラベルについて
* 大体以下のような形で
* ラベルを追加したらここに追記して下さい
 
### 必須ラベル

|label|詳細|
|:--:|:--:|
|admin|管理画面タスク|
|analytics|分析画面タスク|
|archi|アーキテクチャ,ベースとなるもの|
|batch|バッチ機能タスク|
|infra|インフラタスク|
|user|ユーザ画面タスク|
|manage|非機能要件。例）契約|

### 任意ラベル

|label|詳細|
|:--:|:--:|
|bug|バグタスク|
|design|デザインタスク|
|fix|バグより優先度は低いが、いつか治したいタスク|
|question|質問タスク→担当者を入れる|
|todo|TODOタスク|
|want|余裕があれば、入れたい|
