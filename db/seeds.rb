require "discogs-wrapper"

wrapper = Discogs::Wrapper.new("vinyl collection", user_token: "wwUTppzLTLLYndLjLGVdIiPrpkkHGphFRlpRkhgG")

count = 0
arrays = CSV.read("/Users/davidaugustine/Desktop/artists.csv", "rb")
start = false
arrays.each do |array|
  puts array[0]
  if array[0].strip == '2Pac'
    start = true
  end
  if start
    sleep(2.0)
    search  = wrapper.search(array[0], :per_page => 1, :type => :artist)
    if search.results.length > 0
      artist_id = search.results.first.id
      artist  = wrapper.get_artist(artist_id)
      puts artist_id
      puts artist.name
      puts artist.profile
      if !Artist.find_by(name: artist.name) 
        Artist.create(name: artist.name, bio: artist.profile, discogs_ref: artist_id)
      end
    end
  end
end