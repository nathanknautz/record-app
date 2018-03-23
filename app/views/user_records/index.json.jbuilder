json.array! @user_records.each do |user_record|
  json.id user_record.id
  json.first_name user_record.user.first_name
  json.record_id user_record.record.id
  json.status user_record.status
  json.title  user_record.record.title
  json.image_url user_record.image_link
  json.price number_to_currency(user_record.price)
  json.integer_price user_record.price.to_i
  json.genres user_record.record.genres.map {|genre| genre.name}
  json.discogs_album_ref user_record.record.discogs_album_ref
  if user_record.status == 'wish_list'
    json.master_ref user_record.master_reference[0]
    json.lowest_price number_to_currency(user_record.master_reference[1])
  end
  json.artists user_record.artists
  json.release_year user_record.record.release_year
end