json.array! @users.each do |user|
  json.id user.id
  json.current_user_id @current_user_id
  json.first_name user.first_name 
  json.last_name user.last_name 
  json.email user.email 
end