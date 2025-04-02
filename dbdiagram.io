Table follows {
  following_account_id integer
  followed_account_id integer
  created_at timestamp 
}

Table accounts {
  id integer [primary key]
  accountname varchar
  role varchar
  created_at timestamp
}

Table transactions {
  id integer [primary key]
  type varchar
  comments text [note: 'Content of the post']
  account_id integer [not null]
  amount float
  created_at timestamp
}

Table wallets {
  id integer [primary key]
  type varchar [note: 'Bank, Cash, Digital wallet,..']
  account_id integer [not null]
  amount float
  created_at timestamp
}

Ref account_transactions: transactions.account_id > accounts.id // many-to-one
Ref account_wallets: wallets.account_id > accounts.id // many-to-one

Ref: accounts.id < follows.following_account_id

Ref: accounts.id < follows.followed_account_id
