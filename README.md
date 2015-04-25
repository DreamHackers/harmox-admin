# harmox-app
harmoxの総合リポジトリです

## Tree

```
.
├── README.md
├── harmox-admin
└── harmox-analytics
```

|project|detail|
|:--:|:--:|
|harmox-admin|管理画面|
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

|label|詳細|
|:--:|:--:|
|admin|管理画面タスク|
|analytics|分析画面タスク|
|batch|バッチ機能タスク|
|bug|バグタスク|
|design|デザインタスク|
|fix|バグより優先度は低いが、いつか治したいタスク|
|infra|インフラタスク|
|question|質問タスク→担当者を入れる|
|todo|TODOタスク|
|user|ユーザ画面タスク|
|want|余裕があれば、入れたい|
