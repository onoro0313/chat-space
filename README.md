# README



## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true|
|email_address|text|null: false, unique: true|

### Association
- has_many :members
- has_many :groups, through :members
- has_many :messages

##groupsテーブル
|Column|Type|Options|
|------|----|-------|
|group_name|string|null: false, unique: true|

### Association
- has_many :members
- has_many :users, through :members
- has_many :messages

##messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body|text|
|image|string|
|group_id|string|references, foreign_key:true|
|user_id|string|references, foreign_key:true|

## membersテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

