# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# 環境を設定
set :environment, :development

timestamp = Time.now.strftime("%Y%m%d")
# ログは絶対取りたいので、devnullとかなし
# ログはloggerで取る予定。想定外のエラーにはこのログでとってもいいかもしれない
set :output, "log/whenever_" + timestamp + ".log"

every '*/2 * * * *' do
  rake "twitter:retweet"
end

every '*/2 * * * *' do
  rake "twitter:follow"
end

# 以下はメモ。今後追加する時に
# every 4.days do
#   runner "MyModel.some_method" →rails内のメソッド実行するならこれ使って→なのでbot追加処理とかはこういうの定義してもいいかも
#   command "/usr/bin/some_great_command" →bashコマンド実行するならこれかな,linuxの/usr/bin以下にshellを置いておく必要あり
# end

# Learn more: http://github.com/javan/whenever
