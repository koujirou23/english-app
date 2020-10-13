# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------  | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| password_confirmation | string  | null: false |
| tall                  | integer | null: false |
| weight                | integer | null: false |

### Association

- has_many :posts
- has_many :comments

## posts テーブル

| Column          | Type       | Options           |
| --------------- | -------    | ----------------- |
| name            | string     | null: false       |
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
| text          | string     |                   |

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