require "discogs-wrapper"
class UserRecord < ApplicationRecord
  belongs_to :record 
  belongs_to :user
  enum status: { owned: 0, wish_list: 1, removed: 2 }
  
  def image_link
    if record.images.length > 0
      url = record.images[0].image_url
    else
      url = "https://www.mearto.com/assets/no-image-83a2b680abc7af87cfff7777d0756fadb9f9aecd5ebda5d34f8139668e0fc842.png"
    end
    return url
  end

  def artists
    artist_names = []
     record.artists.each do |artist|
      artist_names << artist.name 
    end
    return artist_names.join(", ")
  end

  def master_reference
    arry = []
    wrapper = Discogs::Wrapper.new("vinyl collection", user_token: ENV['DISCOGS_USER_TOKEN'])
    release = wrapper.get_release(record.discogs_album_ref)
    arry << release.master_id
    arry << release.lowest_price
    return arry
     
  end

  def genre_count
    genre_counter = {}
    record.genres.each do |genre|
      if genre_counter[genre.name] == 1
        genre_counter[genre.name] += 1
      else
        genre_counter[genre.name] = 1
      end
    end
    puts genre_counter
  end

end
