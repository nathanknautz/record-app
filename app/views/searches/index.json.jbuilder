json.array! @results.each do |result|
  json.class result.class.name
  if result.class.name  == "Artist"
    json.id result.id
    json.name result.name
    json.images result.artist_images.each do |artist_image|
      json.image_url artist_image.image_url
    end
  else
    json.id result.id
    json.name result.title 
    json.images result.images.each do |image|
      json.image_url image.image_url
    end
  end
end