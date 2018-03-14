json.id record.id
json.title record.title 
json.artist record.artists.each do |artist|
  json.artist artist.name
  json.artist_image artist.artist_images[0].image_url
  json.artist_bio artist.bio
end
json.genres record.genres.each do |genre|
  json.name genre.name
end
json.images record.images.each do |image|
  json.image_url image.image_url
end
json.release_year record.release_year
json.playtime record.playtime
json.tracklist record.tracklist
json.pretty_tracklist record.pretty_tracklist
json.pretty_genres record.pretty_genres
