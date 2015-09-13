#harmox-admin
---
## how to use

[![Join the chat at https://gitter.im/pollseed/twbm](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/pollseed/twbm?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![Circle CI](https://circleci.com/gh/pollseed/twbm/tree/develop.svg?style=svg)](https://circleci.com/gh/pollseed/twbm/tree/develop)
[![Build Status](https://travis-ci.org/pollseed/twbm.svg)](https://travis-ci.org/pollseed/twbm)
[![Code Climate](https://codeclimate.com/github/pollseed/twbm/badges/gpa.svg)](https://codeclimate.com/github/pollseed/twbm)
[![Dependency Status](https://gemnasium.com/pollseed/twbm.svg)](https://gemnasium.com/pollseed/twbm)
[![Inline docs](http://inch-ci.org/github/pollseed/twbm.svg?branch=master&style=shields)](http://inch-ci.org/github/pollseed/twbm)


1. [twitter developer](https://apps.twitter.com/)で登録後キーなどを取得
2. キーをソースに埋め込み
3. 以下コードでツイート

```
$ bundle exec rake twitter:tweet
```

## modelの適用

```.sh
$ bundle exec rake db:migrate
$ RAILS_ENV=test bundle exec rake db:migrate --trace
$ bundle exec rake spec
```
## trackings
* 分析機能は、このリポジトリでは作らない。サーバ別立てし、そこで展開する機能とする
* 現状、botの行動を全てrealtime_{行動するテーブル名}に保管してほしい。

### analysisプロジェクトについて
* このプロジェクトでは、基本realtimeしか関連しない
* データを分析して展開する機能として君臨する
* クローズ機能しかないが、今後はAPIなどに貢献できたらいいという構想がある

## directory
以下は、このpjのadminとjobの分け方サンプル
なぜadminとjobを一緒にしているのかはgoogledocの通り

### admin
* 管理機能
* 変わった使い方は今のところない
* private化完了
* bitbucketを参照

### job
* cronで起動する形を基本形態とする
* config/schedule.rbを使う→job製作者が適宜編集する

```.sh
$ bundle exec whenever
$ bundle exec crontab -e
$ bundle exec whenever --update-crontab
$ bundle exec whenever --clear-crontab
```

## Httpサーバ
* Nginx
※設定はslackへ

## WebAppサーバ
* Unicorn
※設定はslackへ

## Deploy
* Capistrano
※設定はslackへ

## routes
* admin始まりのものが管理機能となる
* job始まりのものがバッチ機能となる

## develop
基本的にはslack上でやりとりする。シクレキーなどが入ってくるようなものは別途管理する必要ある

* rails warnを出さないように気をつける→コンソールでwarn表示がないか確認(当然errorはありえない)

## pullrequest
基本的にはpullrequest

# GET STARTED

1. ruby/harmox-admin/db/document/create_database.sql流すよ
2. `bundle exec rake db:schema:load`

```
├── app
│   ├── assets
│   │   ├── images
│   │   ├── javascripts
│   │   │   ├── admin
│   │   │   ├── application.js
│   │   │   └── job
│   │   └── stylesheets
│   │       ├── admin
│   │       ├── application.css
│   │       └── job
│   ├── controllers
│   │   ├── admin
│   │   ├── application_controller.rb
│   │   ├── concerns
│   │   └── job
│   ├── helpers
│   │   ├── admin
│   │   ├── application_helper.rb
│   │   └── job
│   ├── mailers
│   ├── models
│   └── views
│       ├── admin
│       ├── job
│       ├── layouts
│       └── shared
```
