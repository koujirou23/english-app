## アプリケーション名

English Dairy

## 概要

このアプリケーションは、ユーザー新規登録、ログイン、ログアウト
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
ログインしたユーザーニックネームがツールバーに表示されます。
気になる投稿をクリックするとその投稿の詳細画面へ遷移することができます。
新規投稿はツールバーのNew postをクリックすると新規投稿画面へ遷移します。

### 新規投稿画面
<img width="1440" alt="スクリーンショット 2020-10-22 21 34 47" src="https://user-images.githubusercontent.com/70497233/96872315-71244700-14ae-11eb-89dd-b7cd692299f3.png">

新規投稿画面はログインしたユーザーのみ遷移することが可能です。
ユーザーは英数字、記号のみ使用可能です。それ以外を使用するとエラーが表示されます。
投稿には写真を１枚添付することが可能です。
投稿にタグを紐づけることが可能です。

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
<img width="1431" alt="スクリーンショット 2020-10-22 21 58 11" src="https://user-images.githubusercontent.com/70497233/96874979-b007cc00-14b1-11eb-9afa-634ef79bda05.png">

編集画面では投稿内容が入力されたまま表示されます。
内容を変更して送信ボタンを押すと、投稿内容が変更され詳細画面へ遷移します。

[![Image from Gyazo](https://i.gyazo.com/ee99f162553895329907bc49befc037f.gif)](https://gyazo.com/ee99f162553895329907bc49befc037f)

## 実装予定内容

###### タグの編集機能
投稿内容編集と同時にタグの編集も可能にする予定です。

###### タグ検索機能
投稿内容に紐づいたタグを元に検索を行えるようにする予定です。

###### 単語帳機能
調べた内容を保存してまとめておける機能を追加予定です。
この時日本語の入力は可能です。

###### 翻訳機能
google translate apiを用いて翻訳機能を追加予定です。

###### マイページの追加
ユーザーの自己紹介などのページを作成、プロフィール画像の設定を可能にする予定です。

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