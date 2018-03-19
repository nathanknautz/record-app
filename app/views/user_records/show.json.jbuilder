json.record_id @user_record.id
json.title  @user_record.record.title
json.artist @user_record.record.artists
json.release_year @user_record.record.release_year
json.playtime @user_record.record.playtime
json.genres @user_record.record.genres.map {|genre| genre.name}
json.genre_count @user_record.genre_count
json.tracklist @user_record.record.tracklist