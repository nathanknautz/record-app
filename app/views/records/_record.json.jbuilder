json.id record.id
json.title record.title 
json.artist record.artists.map {|artist| artist.name}
json.genres record.genres.map {|genre| genre.name}
#json.images record.images
json.release_year record.release_year
json.playtime record.playtime
json.tracklist record.tracklist