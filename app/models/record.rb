class Record < ApplicationRecord
  has_many :images
  has_many :user_records
  has_many :users, through: :user_records
  has_many :record_genres
  has_many :genres, through: :record_genres
  has_many :artist_records 
  has_many :artists, through: :artist_records

end
