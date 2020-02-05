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

|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
- has_many :messages


## messagesテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|null: false|
|image|text|
|user_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- has_many :message_prefectures
- has_many :prefectures, through: :message_prefectures


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :municipalities
- has_many :message_prefectures
- has_many :messages, through: :message_prefectures


## municipalitiesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- belongs_to :prefecture


## message_prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|message_id|integer|null: false, foregin_key: true|
|prefecture_id|integer|null: false, foregin_key: true|

### Association
- belongs_to :message
- belongs_to :prefecture

