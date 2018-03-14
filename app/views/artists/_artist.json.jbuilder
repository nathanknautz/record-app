json.id artist.id
json.name artist.name
json.bio artist.bio
json.images artist.artist_images.each do |image|
  json.image_id image.id 
  json.image_url image.image_url
  end
json.records artist.records.each do |record|
  json.id record.id
  json.title record.title 
  json.release_year record.release_year
  json.record_images record.images.each do |image|
    json.image_url image.image_url
  end

end
