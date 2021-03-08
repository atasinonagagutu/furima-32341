# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null; false | 
| email     | string | null: false |
| password  | string | null: false |
| name      | string | null: false |
| name_kana | string | null: false |
| birthday  | string | null: false |

### Association

- has_many :items
- has_many :purchase_users

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| delivery_source | string     | null: false                    |
| delivery_days   | string     | null: false                    |
| price           | string     | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one    :purchase_user
- has_one    :destination, through: purchase_user

## purchase_users テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user_id | reference  | null: false, foreign_key: true |
| item_id | reference  | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :item

## destination
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_cord    | string     | null: false                    |
| prefecture     | string     | null: false                    |
| city           | string     | null: false                    |
| address_line   | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| purchase_users | reference  | null: false, foreign_key: true |

### Association
- has_one :purchase_user
- has_one :item, through: purchase_user
