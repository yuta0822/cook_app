#  cook_app
### 料理レシピを投稿ができるアプリケーション
![Uploading bbeb81f4a5de3878be2a2f272d291d6f.jpg…]()


# 概要

### 誰でも料理レシピを投稿することができる

# 利用方法

#### `☆ トップページから新規登録・ログイン`
#### `☆ 一覧画面へ遷移する`
#### `☆ 料理レシピを投稿することができる`
#### `☆ 投稿完了後は一覧画面へ戻る`
#### `☆ 投稿詳細画面へ遷移する`
#### `☆ 投稿者本人であれば投稿の編集・削除が投稿詳細画面から可能になる`
#### `☆ 投稿詳細画面からコメントができる`

# 課題解決

| ユーザーストーリーから考える課題                                                        | 課題解決                                         |
| ------------------------------------------------------------------------------- | ------------------------------------------------- |
| 料理をどう始めればいいのか悩んでいる 　　　　　　　                                        | 手軽な料理レシピを掲載し、料理に対して興味を沸かせる |



# 機能一覧

| 機能           | 概要             |
| -------------- | -----------------|
| ユーザー管理機能　| 新規登録・ログイン・ログアウトが可能  |
| 投稿機能 | 画像付きで料理レシピ投稿が可能 |
| 投稿詳細表示機能 | 各投稿詳細が詳細ページで閲覧可能 |
| 投稿編集・削除機能 | 投稿者本人のみ投稿編集・削除が可能 |
| コメント機能 | 投稿詳細ページから非同期通信でコメントが可能|

# 追加予定機能

## LIKE機能

| 特徴            | 概要             |
| -------------- | -----------------|
| LIKEした数を表示する | 数が多ければランキングの上位にレシピを紹介される |
| 非同期通信活用 | 通信量の削減が可能となり、パフォーマンスの向上 |
 

# ローカルでの動作方法

$ git clone 
</br>
$ cd global-day
</br>
$ bundle install
</br>
$ rails db:create
</br>
$ rails db:migrate
</br>
$ rails s
</br>

# 開発環境

- VScode
- Ruby 2.6.5
- Rails 6.0.3.4
- mysql2 0.5.3
- JavaScript
- gem 3.0.3
- heroku 7.46.0


# DB設計

# テーブル設計

## users テーブル
| Column             | Type   | Options                  |
| -----------------  | ------ | -------------------------|
| nickname	         | string	| null: false unique: true |
| email              | string | null: false              |
| encrypted_password | string | null: false              |
| genre_id           | integer| null: false              |
| profile            | text   | null: false              |

### Association
- has_many :cooks
- has_many :likes
- has_many :comments
- belongs_to_active_hash :genre

with_options presence: true do
  validates :nickname
  validates :profile
end
with_options presence: true,numericality: { other_than: 1 } do
  validates :genre_id
end

## cooksテーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| catch_copy    | text       | null: false                    |
| category_id   | integer    | null: false                    |
| time_id       | integer    | null: false                    |
| material      | text       | null: false                    |
| making        | text       | null: false                    |
| point         | test       |                                |
| user          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :likes        
- has_many :comments
- belongs_to_active_hash :category_id
- belongs_to_active_hash :time_id

with_options presence: true do
  validates :title
  validates :catch_copy
  validates :material
  validates :making
end
with_options presence: true,numericality: { other_than: 1 } do
  validates :category_id
  validates :time_id
end


##  likes テーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| cook          | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :cook


##  comments テーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| cook          | references | null: false, foreign_key: true |
| text          | text       | null: false                    |

### Association
- belongs_to :user
- belongs_to :cook
