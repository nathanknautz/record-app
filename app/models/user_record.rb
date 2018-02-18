class UserRecord < ApplicationRecord
  enum status: [:owned, :wish_list, :removed]
  
  
end
