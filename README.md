# DB設計

# テーブル設計

## users テーブル
| Column             | Type   | Options                  |
| -----------------  | ------ | -------------------------|
| nickname	         | string	| null: false unique: true |
| email              | string | null: false unique: true |
| encrypted_password | string | null: false              |
| genre_id           | integer| null: false              |
| profile            | text   | null: false              |

### Association
- has_many: cooks
- has_many: likes
- has_many: comments
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
- belongs_to             :user
- has_many: likes        
- has_many: comments
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
- belongs_to: user
- belongs_to: cook


##  comments テーブル
| Column        | Type       | Options                        |
| -----------   | ---------- | ------------------------------ |
| user          | references | null: false, foreign_key: true |
| cook         | references | null: false, foreign_key: true |
| text          | text       | null: false                    |

### Association
- belongs_to: user
- belongs_to: cook