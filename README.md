# README
# アプリの概要
# 機能一覧
・GoogleMapの表示(ホームページ、イベント詳細ページ(GoogleMapsforRails、Maps JavaScript API))
・GoogleMap上への複数地点表示機能
・現在地取得機能(GoogleMapsforRails、Geolocation API)
・住所から緯度経度に変換するジオコーディング機能(Geocoder)
・位置検索(GoogleMapsforRails)
・ユーザー認証システム(アカウント登録、ログインログアウト、アカウント情報編集、アカウント削除(devise))
・イベント投稿機能(ジオコーディング機能あり)
・イベント参加機能(他のユーザーのイベントのみ、自分主催のイベントは強制参加)
・画像投稿および表示機能(carrierwave、mini_magick)
・イベント削除機能(ログイン中の自分の投稿のみ)
・ページネーション(will_paginate、bootstrap-will_paginate)
・日本語化(devise-i18n、rails-i18n)
・静的解析(rubocop、rubocop-airbnb)
・テスト(Rspec())
# 使用技術一覧
# 今後
・イベント開催時間投稿機能
・参加制限機能(参加人数や開催日時による制限、作成したイベントの参加締め切り)
・イベント位置情報投稿機能改善(地図から選べるようにする)
・Googlemapのテスト
・名前変更機能
・イベント一覧ページのN+1問題の解消(ページネーション)
This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
