class Genre < ApplicationRecord
  has_many :record_genres
  has_many :records, through: :record_genres 
end
