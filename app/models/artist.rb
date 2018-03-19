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

  def artist_image_url
    if artist_images.length > 0
      url = artist_images[0].image_url
    else
      url = "https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png"
    end
    return url
  end

end
