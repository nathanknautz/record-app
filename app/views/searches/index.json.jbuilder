json.array! @results.each do |result|
  json.class result.class.name
  if result.class.name  == "Artist"
    json.id result.id
    if result.name.length > 23
      json.name result.name[0,20] + "..."
    else
      json.name result.name 
    end
    json.images result.artist_images.each do |artist_image|
      json.image_url artist_image.image_url
    end
  else
    json.id result.id
    if result.title.length > 23
      json.name result.title[0,20] + "..."
    else
      json.name result.title 
    end
    json.images result.images.each do |image|
      json.image_url image.image_url
    end
  end
end