class Artist < ApplicationRecord
  has_many :images
  has_many :artist_records
  has_many :records, through: :artist_records
end
