# ここらへん_Flutter版_Readme



## スクリーンショット
| 店舗一覧(light) | 店舗一覧(dark) |
|:-:|:-:|
|  ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 50 27](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/577e3572-98fb-4b56-8c04-b0ce2de1347c) |  ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 50 30](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/08dc7572-dd52-4f86-9daf-85e67ca7d04d)|


| 詳細(light) | 詳細(dark) |
|:-:|:-:|
| ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 50 34](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/589d939e-4fb6-4f09-a9e9-81e13d248079)| ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 50 35](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/9c72fe4e-2f9a-4d9d-b065-5bac1955af86)|


| 結果なし | エラー |
|:-:|:-:|
| ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 53 04](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/c814fa22-d611-4485-8f32-8ec050764ea8)| ![Simulator Screenshot - iPhone 15 Pro - 2024-02-23 at 01 57 03](https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/5c1553cc-b07f-49b5-81fe-724d25376624)|

#### demo

https://github.com/gadgelogger/kokorahenn_flutter/assets/39609331/f483bd2e-751b-44fe-b334-62e78a590a45



### 動作
- スマートフォンの位置情報を取得する
- 取得した位置情報から現在地付近のレストラン情報を検索できる
- 検索結果は一覧で概要を表示する
- 検索閣下のアイテムをタップしたら、大まかな店舗の情報（店舗名、住所、営業時間、閉業日、カテゴリ名）を表示する
- ”お店の詳細を見る”ボタンを押すと、詳細画面に画面遷移し以下の情報を表示する。（マップ表示ボタン、 Webブラウザ表示ボタン、Googleで検索できるボタン、住所、営業時間、閉業日、ジャンル、食べ放題、飲み放題、コース、総席数、禁煙、平均予算、カード決済、駐車場、バリアフリー、その他設備、備考）
### UI/UX
- エラー発生時の処理
- 画面回転・さまざまな画面サイズ対応
- ダークモードの対応
- 多言語対応（英語、日本語）
# 環境
-  IDE:Visual Studio Code 1.86.1
-  Flutter: 3.19.1
-  Dart: 3.3.0
-  サポートするプラットフォーム: iOS/Android
# 状態管理
flutter_riverpod:^2.4.10
# 使用技術とパッケージ
- GithubActionsによるCI
- flutter_riverpod -状態管理（Themeの切り替えの際に使用）
- cupertino_icons
- dio
- envied
- expansion_tile_card
- flutter_localization
- flutter_overboard
- flutter_svg
- freezed
- freezed_annotation
- geolocator
- json_annotation
- map_launcher
- package_info_plus
- retrofit
- settings_ui
- share_plus
- shared_preferences
- slang
- slang_flutter
- url_launcher

----dev----
- build_runner
- envied_generator
- flutter_launcher_icons
- flutter_lints
- flutter_native_splash
- json_serializable
- pedantic_mono
- retrofit_generator
- slang_build_runner
# フォルダ構成
```
lib
│   ├── api # APIの処理を担当するディレクトリ
│   │   ├── client # APIクライアントの設定
│   │   └── service # APIからデータを取得するサービス層
│   ├── constants # アプリ全体で使用する定数を管理（後で消すかも）
│   ├── env # 環境変数やアプリの設定を管理
│   ├── i18n # 多言語対応
│   ├── main.dart # アプリのエントリーポイント
│   ├── model # データモデルの定義
│   │   ├── dto # APIから受け取ったデータの形状を定義
│   │   └── response # APIからのレスポンスデータの形状を定義
│   ├── screens # アプリの各画面を構成するウィジェットを格納するディレクトリ
│   ├── theme # アプリのテーマ設定（色、テキストスタイルなど）を管理するディレクトリ
│   └── widgets # 再利用可能なウィジェットを格納するディレクトリ
│       ├── detail # 詳細画面で使用するウィジェットを格納するディレクトリ
│       └── search # 検索機能に関連するウィジェットを格納するディレクトリ

```
# ビルド手順（※メモ）
todo:envKeyの設定コマンドを追記すること
- クローン
```
https://github.com/gadgelogger/kokorahenn_flutter.git
```
- ディレクトリへ移動
```
cd kokorahenn_flutter
```

- fvm読み込み
```
fvm install

```

- 依存関係を読み込む
```
fvm flutter pub get

```

- freezedなどのコード生成
```
fvm dart run build_runner build -d  
```

- ビルドラン
```
fvm flutter run
```

# CI
- `develop`または`main`ブランチにプルリクエストが出された時に動作する
- フォーマットが崩れていないか
- build_runnerでのファイルの生成
- 静的解析に引っ掛かっていないか（警告が出ないか）
# Note
- issueドリブンで開発をしました。
- プルリクエストベースで開発をしました。
- コードの可読性を重視して、Widgetを分割しました。
- シンプルかつスタイリッシュなデザインを意識しました。
- さまざまな方に使ってもらいたい気持ちがあるため多言語対応をしました。
# 感想、難しかったところ
- テストの知見が浅いため、テストの実装ができなかった。
- アーキテクチの知見がなかったため導入できなかった。
- 本格的にGithubActionのCIを使ったが、便利さが感じられていいなと思った。（リリースビルドまで自動化してみたい）
# コレから実装したい機能（間に合わなかったところ）
- ページネーション機能（１ページだけではなくスクロールし続けたら次のインデックスを取得できるようにしたい）
- 他のカテゴリで絞り込める機能（今回は期間の都合上、検索半径だけでしたがジャンルで絞り込みなどをできるようにしたい）
- 他のAPIに切り替えるようにしたい（リクルートだけではなくPlaceAPIなども使えるようにして、レストラン以外の検索もできるようにしたい）
- テストを実装して品質保証を上げたい
- アーキテクチャを考慮した実装を行いたい

# 帰属表示
アプリのアイコンには[Lordicon](https://lordicon.com/)を使用しました。

