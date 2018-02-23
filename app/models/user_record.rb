class UserRecord < ApplicationRecord
  belongs_to :record 
  belongs_to :user
  enum status: { owned: 0, wish_list: 1, removed: 2 }
  
  
end
