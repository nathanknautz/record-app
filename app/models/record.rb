class Record < ApplicationRecord
  has_many :images
  has_many :user_records
  has_many :users, through: :user_records
  has_many :record_genres
  has_many :genres, through: :record_genres
  has_many :artist_records 
  has_many :artists, through: :artist_records

  def pretty_tracklist
    new_list = tracklist.split(",")
    new_list.each do |track|
       track 
    end
  end

  def pretty_genres
    new_genres = []
    genres.each do |genre|
      new_genres << genre["name"]
    end
    new_genres.join(", ")
  end

  def record_image_url
    if images.length > 0
      url = images[0].image_url
    else
      url = "https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png"
    end
    return url
  end


end


