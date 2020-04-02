# Travel-memo

# 概要
- 都道府県市区町村のタグを使用して投稿、検索ができるサイト

# 現在実装できている機能一覧
- 画像を含めた投稿機能

# 開発環境
- Haml
- SCSS
- JavaScript
- jQuery
- Ruby
- Ruby on Rails
- MySQL
- AWS
- VSCode(Visual Studio Code)

# 本番環境
## URL
- ### http://18.180.90.132/
## ID/PASS
- ### username ohotsuku
- ### password 5533 
## テスト用アカウント
### メールアドレス
- ### kurione@gmail.com
### パスワード 
- ### kurione

# 制作背景

- 都道府県市区町村のタグをつけ、市区町村別に検索できるようにすることで、地名ごとに情報収集しやすいアプリケーションを作成したい
- レコメンドシステムを使用して、価値観の合う人同士が繋がり、情報交換できるようなプラットフォームを提供したい

# 課題や今後実装した機能

## 課題
- APIを利用して、都道府県市区町村の情報を取得する

## 今後実装したい機能
- 投稿に都道府県市区町村のタグを付与する

- 協調フィルタリングというレコメンドを利用して、ユーザーごとにおすすめを提供する

- 投稿に対してのいいね機能

- ユーザーに対してのフォロー機能

# DB設計

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true|
|email|string|null: false, unique: true|
|password|string|null: false|
|introduction|text|
|image|text|
|phone|integer|

### Association
- has_many :posts
- has_many :likes
- has_many :comments
- has_many :group_users
- has_many :group_messages
- has_many :dmail_users
- has_many :dmail_messages
- has_many :relationships


## dmailsテーブル
|Column|Type|Options|
|------|----|-------|

### Association
- has_many :dmail_users
- has_many :dmail_messages


## dmail_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|string|
|user_id|bigint|null: false, foreign_key: true|
|dmail_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :dmail
- belongs_to :user


## dmail_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|dmail_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :dmail
- belongs_to :user


## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :group_messages
- has_many :group_users


## group_messagesテーブル
|Column|Type|Options|
|------|----|-------|
|message|string|
|user_id|bigint|null: false, foreign_key: true|
|group_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :gourp
- belongs_to :user


## group_usersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreign_key: true|
|group_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user


## relationshipsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|bigint|null: false, foreig_key: true|
|follow_id|bigint|null: false, foreign_key: { to_table: :users}, unipue: true|

### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'


## commentsテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|
|user_id|bigint|null: false, foreign_key: true|
|post_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :post

## likesテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|post_id|integer|

### Association
- belongs_to :user
- belongs_to :post

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|post|text|
|user_id|bigint|null: false, foreign_key: true|
|place_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :place
- has_many :comments
- has_many :likes
- has_many :images
- has_many :post_tags


## imagesテーブル

|Column|Type|Options|
|------|----|-------|
|image|text|
|post_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :post

## tagsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|

### Association
- has_many :post_tags


## post_tagテーブル

|Column|Type|Options|
|------|----|-------|
|post_id|bigint|null: false, foreign_key: true|
|tag_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :post
- belongs_to :tag

## placesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|prefecture_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :prefecture
- has_many :posts


## prefecturesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :places
- has_many :municipalities

## municipalitiesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|prefecture_id|bigint|null: false, foreign_key: true|

### Association
- belongs_to :prefecture
