// Use DBML to define your database structure
// Docs: https://dbml.dbdiagram.io/docs
Table users {
  user_id varchar [pk]
  name varchar
  username varchar
  password varchar
  updated_at timestamp
  created_at timestamp
  is_deleted boolean
}
Table parent_categories {
  parent_category_id varchar [pk]
  name varchar
  category_type varchar [note: 'Earned/Paid']
  updated_at timestamp
  created_at timestamp
  is_deleted boolean
}
Table categories {
  category_id varchar [pk]
  user_id varchar
  name varchar
  updated_at timestamp
  created_at timestamp
  is_deleted boolean
}
Table transactions {
  transaction_id varchar [pk]
  transaction_type varchar
  transaction_date timestamp
  amount float
  comment varchar
  is_reported boolean
  category_id varchar
  user_id varchar
  wallet_id varchar
  updated_at timestamp
  created_at timestamp
  is_deleted boolean
}
Table wallets {
  wallet_id varchar [pk]
  user_id varchar
  name varchar
  updated_at timestamp
  created_at timestamp
  is_deleted boolean
}
Ref parent_categories_categories: parent_categories.parent_category_id < categories.category_id
Ref users_categories: categories.user_id > users.user_id 
Ref transactions_categories: transactions.category_id > categories.category_id
Ref transactions_categories: transactions.user_id > categories.user_id
Ref users_wallets: users.user_id < wallets.user_id
Ref transactions_wallets: transactions.wallet_id > wallets.wallet_id