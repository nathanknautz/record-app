json.id record.id
json.title record.title 
json.artist record.artists.each do |artist|
  json.id artist.id
  json.artist artist.name
  json.artist_image artist.artist_image_url
  json.artist_bio artist.bio
end
json.genres record.genres.each do |genre|
  json.name genre.name
end
json.image_url record.record_image_url
json.release_year record.release_year
json.playtime record.playtime
json.tracklist record.tracklist
json.pretty_tracklist record.pretty_tracklist
json.pretty_genres record.pretty_genres
