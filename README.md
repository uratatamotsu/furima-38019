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
| first name            | string    | null: false               |
| last name             | string    | null: false               |
| email                 | string    | null: false, unique: true |
| encrypted_password    | string    | null: false               |
| birthday              | integer   | null: false               |


## timesテーブル
| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| user               | references    | null: false, foreign_key: true |
| exhibits_name      | string        | null: false                    |
| exhibits_text      | string        | null: false                    |
| money              | integer       | null: false                    |
| category           | string        | null: false                    |
| situation          | string        | null: false                    |
| shipping_cost      | string        | null: false                    |
| delivery_area      | string        | null: false                    |
| shipping_days      | integer       | null: false                    |


## commentsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| content            | text       | null: false                    |
| time               | references | null: false, foreign_key: true |
| user               | references | null: false, foreign_key: true |


## purchasesテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |


## sendsテーブル
| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| purchaser             | references | null: false, foreign_key: true |
| post_code             | integer    | null: false                    |
| prefecture            | string     | null: false                    |
| city                  | string     | null: false                    |
| address               | integer    | null: false                    |
| building              | string     |                                |
| tell                  | integer    | null: false                    |