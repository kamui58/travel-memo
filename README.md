# Travel-memo

# 概要
- 場所、都道府県、市区町村を利用して投稿、検索ができるサイト

# 現在実装できている機能一覧
- 画像を含めた投稿機能
- 観光地、施設名などから住所、都道府県、市区町村を表示する機能
- ワードから検索する機能
- マイページ機能
- 自分が投稿した内容を削除する機能

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

- 観光地、施設名、都道府県、市区町村から検索できるようにすることで、投稿した内容を検索しやすくし、市区町村の情報を簡単に取得できるようにしたい

- レコメンドシステムを利用して、ユーザーの好みに合わせた投稿を表示できるようにして、市区町村別の情報収集をしやすくしたい

という思いから制作

# 今後実装したい機能
- 都道府県、市区町村のリンクからそれに対応した投稿内容を見れるようにする

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
|user_id|bigint|
|post_id|bigint|

### Association
- belongs_to :user
- belongs_to :post

## postsテーブル

|Column|Type|Options|
|------|----|-------|
|message|text|
|user_id|references|null: false, foreign_key: true|
|place_id|bigint|

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
|post_id|references|null: false, foreign_key: true|

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
|post_id|references|null: false, foreign_key: true|
|tag_id|bigint|null: false|

### Association
- belongs_to :post
- belongs_to :tag

## placesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|
|address|string|
|prefecture|string|
|municipality|string|

### Association
- has_many :posts