# Travel-memo

# 概要
- ユーザーが画像を含めた投稿ができる


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

- 都道府県市区町村のタグをつけることで情報を分けて投稿できるようにして、情報を拡散しやすいプラットフォームを提供したい
- 価値観の合う人同士が繋がって、情報交換できるようなプラットフォームを提供して、利用者に人生を楽しく生きてほしい

# 工夫したポイント

# 開発環境
- Ruby
- Ruby on Rails
- Haml
- SCSS
- VSCode(Visual Studio Code)

# 課題や今後実装した機能
## 課題
- 画像ファイルが大きすぎるとエラーが発生する
- どのような指標を用いて、どのような協調フィルタリングを実装するかが未定
（閲覧履歴、フォロー、いいね機能etc）

## 今後実装したい機能
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
