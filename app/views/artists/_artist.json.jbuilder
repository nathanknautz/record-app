json.id artist.id
json.name artist.name
json.bio artist.bio
json.image_url artist.artist_image_url
json.records artist.records.each do |record|
  json.id record.id
  json.title record.title 
  json.release_year record.release_year
  json.tracklist record.pretty_tracklist
  json.record_image_url record.record_image_url
  end
