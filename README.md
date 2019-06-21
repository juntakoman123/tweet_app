# 説明書

このポートフォリオは某gateさんのtweet_appというものが元になってます
個人的に足りないなと思うところを実装して、heroku上にデプロイしていきます

環境紹介

os: ubuntu(linux)
rails -v: 5.2.3
ruby 2.5.1
db: 全環境postgreaql


足りない所

* フォローフォロワー機能がない点
* 画像投稿できない点
* ユーザー一覧で画像と名前しかなく自己紹介が簡潔ではない点
* 投稿一覧画面に時間要素がない(いつ投稿したのか？)点
* このアプリ上での時間(タイムゾーン)が日本に合わせたものではない点
* リツイート機能ない点
* いいね機能が非同期処理ではない(リダイレクトしてる)点
* 管理者ユーザーがいない点(気に入らないユーザーをいわゆる凍結などできる)
* twiterなどでログインできない点
* 投稿などを削除した際にそれに関連するいいねなどのデータが整合性を保てずエラーになる点
* ログイン認証がセッションだけに頼ってる点(さすがにcookieは欲しい)
今回は計11点の問題を解決していきます
