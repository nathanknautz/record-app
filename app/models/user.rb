class User < ApplicationRecord
  has_secure_password
  validates :last_name, presence: true 
  validates :first_name, presence: true 
  validates :email, presence: true, uniqueness: true
  has_many :user_records
  has_many :records, through: :user_records

  def get_current_user
    return current_user.id
  end
end
