class Artist < ApplicationRecord
  has_many :artist_images
  has_many :artist_records
  has_many :records, through: :artist_records
end
