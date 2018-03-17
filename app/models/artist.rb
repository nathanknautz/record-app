class Artist < ApplicationRecord
  has_many :artist_images
  has_many :artist_records
  has_many :records, through: :artist_records


  def pretty_tracklist
    new_list = tracklist.split(",")
    new_list.each do |track|
       track 
    end
  end
end
