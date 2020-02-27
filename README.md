# BG Match
手軽にボードゲームのイベントを開催または探すことができるサービスです。  
位置情報付きのイベントを作成することができます。  
また、GoogleMapを用いて現在地または指定した場所周辺のイベントを探して、参加することができます。  
# 機能一覧(使用したgem、技術など)
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
# テスト
Rspec(request spec、feature spec、model spec)
# 使用技術
・Ruby 2.7.0  
・Ruby on Rails 5.1.7  
・MySQL 5.7  
・Nginx  
・AWS(EC2、S3、VPC)  
・Docker  
・GitHub  