## アプリケーション名

English Dairy  

## 接続先

https://english-dairy.herokuapp.com/

## ID, Pass

ID: admin  
Pass: 2222  

## テスト用アカウント等
投稿用  
メールアドレス: tanaka@gmail.com   
パスワード: tanaka123  
コメント用  
メールアドレス名: yamada@gmail.com  
パスワード: yamada123  

## 動作確認方法

WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。  
ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。  
接続先およびログイン情報については、上記の通りです。  
同時に複数の方がログインしている場合に、ログインできない可能性があります。 
動作確認後ログアウト処理をお願いします。

## 投稿方法
テストアカウントでログイン→トップページからNew postボタン押下→投稿内容入力→投稿  
※一部実装できていない機能がございます。

## コメント投稿方法
テストアカウントでログイン→トップページから画像をクリック→comment欄に内容入力→投稿

## 開発環境
Ruby/Ruby on Rails/MySQL/Github/AWS/Visual Studio Code

## 概要

このアプリケーションは、ユーザー新規登録、ログイン、ログアウト、ユーザー情報編集、
新規投稿、投稿内容編集、投稿の削除、投稿にコメントをすることができます。

## 制作背景(意図)

現在私自身も英語を学習中で、英語学習方法に英語日記を書くという方法があります。  
しかし、英語日記は主にブログが使用されるので最初は閲覧数が見込めず同じ目的の人との交流が見込めないため、モチベーションの維持が難しくなります。  
専用アプリがあると同じ目的の人との交流があり、投稿のコメント機能で他ユーザーとのやりとりが発生しモチベーションの維持を保つことができ学習を楽しく進められると思い今回制作しました。  
また、学習したことのアウトプットの場になることで知識の定着を図ることができます。  

## アプリ機能
トップページ(投稿一覧表示画面)
<img width="1436" alt="スクリーンショット 2020-10-22 21 22 41" src="https://user-images.githubusercontent.com/70497233/96871128-cbbca380-14ac-11eb-9e6d-57c73c83843d.png">

トップページでは新規登録、ログイン、ログアウトが可能です。  
ログインしたユーザーニックネームがツールバーに表示されます  
気になる投稿をクリックするとその投稿の詳細画面へ遷移することができます。  
新規投稿はツールバーのNew postをクリックすると新規投稿画面へ遷移します。  

### 新規投稿画面
<img width="1440" alt="スクリーンショット 2020-10-22 21 34 47" src="https://user-images.githubusercontent.com/70497233/96872315-71244700-14ae-11eb-89dd-b7cd692299f3.png">

新規投稿画面はログインしたユーザーのみ遷移することが可能です。  
ユーザーは英数字、記号のみ使用可能です。それ以外を使用するとエラーが表示されます。  
投稿には写真を１枚添付することが可能です。  
投稿にタグを紐づけることが可能です。(コンマで区切ると２つ以上保存可能です)  

[![Image from Gyazo](https://i.gyazo.com/b32775599de871b70b6fe7bfefce3027.gif)](https://gyazo.com/b32775599de871b70b6fe7bfefce3027)

### 詳細画面
<img width="1440" alt="スクリーンショット 2020-10-22 21 38 07" src="https://user-images.githubusercontent.com/70497233/96872661-e2fc9080-14ae-11eb-8c1f-1c37ad09983a.png">

投稿内容の詳細を確認することができます。  
投稿者本人には編集用ボタン(Edit)、削除用ボタン(Delete)が表示されます。  
編集ボタンを押すと編集画面へ遷移します。  
削除ボタンを押すと投稿は削除されトップページへ遷移します。(下図参照)  

[![Image from Gyazo](https://i.gyazo.com/703693dab2bed5f0d1ca22b5669a0dfb.gif)](https://gyazo.com/703693dab2bed5f0d1ca22b5669a0dfb)

コメント欄にコメントを入力し、送信ボタン(Send)を押すと、コメントが投稿されます。  
コメント投稿者本人はコメントの削除が可能です。(下図参照)  

[![Image from Gyazo](https://i.gyazo.com/8ab19a742a89cbe1b1348c1ded2c9e29.gif)](https://gyazo.com/8ab19a742a89cbe1b1348c1ded2c9e29)

投稿者本人以外は編集、削除ボタンの表示されません。  
コメント投稿者本人意外にはコメント削除ボタンが表示されません。  

<img width="1436" alt="スクリーンショット 2020-10-22 21 53 37" src="https://user-images.githubusercontent.com/70497233/96874413-0d4f4d80-14b1-11eb-82a0-ad0c29808511.png">

### 編集画面
ツールバーの編集ボタンを押すと編集画面に遷移します。  

[![Image from Gyazo](https://i.gyazo.com/467217422bec4bfe8ea226a314a62161.gif)](https://gyazo.com/467217422bec4bfe8ea226a314a62161)

編集画面では投稿内容が入力されたまま表示されます。  
内容を変更して送信ボタンを押すと、投稿内容が変更され詳細画面へ遷移します。  
タグをコンマ(,)で区切るとタグを２つ以上保存することができます。  

[![Image from Gyazo](https://i.gyazo.com/9382c9302e34f6f62bcee01ccbcf5a19.gif)](https://gyazo.com/9382c9302e34f6f62bcee01ccbcf5a19)

### マイページ
ツールバー、投稿詳細画面のニックネームをクリックするとそのユーザーのマイページへ遷移します。  
マイページにはプロフィール画像、ニックネーム、そのユーザーが投稿した物が一覧表示されます。  
プロフィール画像を設定していないユーザーにはデフォルトの画像を表示します。  
ログイン中のユーザーにはプロフィール編集画面と退会ボタンが表示されます。
ログイン中のユーザーはプロフィール編集画面で画像、ニックネーム、メールアドレスの変更できます。

(現在ログイン中のユーザー)

[![Image from Gyazo](https://i.gyazo.com/17f77b3facea76c12201d5ab2081a9d9.gif)](https://gyazo.com/17f77b3facea76c12201d5ab2081a9d9)

(他ユーザー画面)

[![Image from Gyazo](https://i.gyazo.com/040a6cc2fb4a451cfddfe2021f1d6ac4.gif)](https://gyazo.com/040a6cc2fb4a451cfddfe2021f1d6ac4)

(プロフィール編集画面)

[![Image from Gyazo](https://i.gyazo.com/a36bc965935290b7f4646f6c9d41fe32.gif)](https://gyazo.com/a36bc965935290b7f4646f6c9d41fe32)

## 実装予定内容

###### タグ検索機能
投稿内容に紐づいたタグを元に検索を行えるようにする予定です。

###### 単語帳機能
調べた内容を保存してまとめておける機能を追加予定です。
この時日本語の入力は可能です。

###### 翻訳機能
google translate apiを用いて翻訳機能を追加予定です。


# DB設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column          | Type       | Options           |
| --------------- | -------    | ----------------- |
| title           | string     | null: false       |
| text            | text       | null: false       |
| user            | references | foreign_key: true |

### Association

- belongs_to :user
- has_many :comments
- has_many :posts_tags
- has_many :tags, through: :posts_tags

## tags テーブル

| Column        | Type       | Options           |
| ----------    | ---------- | ----------------- |
| name          | string     |                   |

### Association

- has_many :posts_tags
- has_many :posts, through: :posts_tags

## posts_tags テーブル

| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| post       | references    | foreign_key: true |
| tag        | references    | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :tag

## comments テーブル

| Column     | Type          | Options           |
| ---------- | ------------- | ----------------- |
| text       | string        | null: false       |
| post       | references    | foreign_key: true |
| tag        | references    | foreign_key: true |

### Association

- belongs_to :post
- belongs_to :user
