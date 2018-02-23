json.array! @user_records.each do |user_record|
  json.id user_record.id
  json.title  user_record.record.title
  json.artist user_record.record.artists
  json.release_year user_record.record.release_year
end