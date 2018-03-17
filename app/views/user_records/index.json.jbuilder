json.array! @user_records.each do |user_record|
  json.id user_record.id
  json.title  user_record.record.title
  json.image_url user_record.image_link
  json.price number_to_currency(user_record.price)
  json.artists user_record.artists
  json.release_year user_record.record.release_year
end