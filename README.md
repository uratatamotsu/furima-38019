# README

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

## usersテーブル
| Column                | Type      | Options                   |
| --------------------- | --------- | ------------------------- |
| nickname              | string    | null: false               |
| first_name            | string    | null: false               |
| last_name             | string    | null: false               |
| first_name_kana       | string    | null: false               |
| last_name_kana        | string    | null: false               |
| email                 | string    | null: false, unique: true |
| encrypted_password    | string    | null: false               |
| birthday              | date      | null: false               |
### Association users
has_many :items
has_many :purchases
has_many :comments

## itemsテーブル
| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| user               | references    | null: false, foreign_key: true |
| exhibits_name      | string        | null: false                    |
| exhibits_text      | text          | null: false                    |
| money              | integer       | null: false                    |
| category_id        | integer       | null: false                    |
| situation_id       | integer       | null: false                    |
| shipping_cost_id   | integer       | null: false                    |
| delivery_area_id   | integer       | null: false                    |
| shipping_days_id   | integer       | null: false                    |
### Association items
belongs_to :user
has_one :purchase
has_many :comments


## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| time               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |
### Association comments
belongs_to :user
belongs_to :item


## purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
### Association purchases
belongs_to :user
belongs_to :item
has_one :send


## sendsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchase              | references | null: false, foreign_key: true |
| post_code             | string     | null: false                    |
| delivery_area_id      | integer    | null: false                    |
| city                  | string     | null: false                    |
| address               | string     | null: false                    |
| building              | string     |                                |
| tell                  | string     | null: false                    |
### Association sends
belongs_to :purchase