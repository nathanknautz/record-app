require 'discogs'

wrapper = Discogs::Wrapper.new("vinyl collection")

# auth_wrapper = Discogs::Wrapper.new("My awesome web app", user_token: "my_user_token")
# search   = auth_wrapper.search("Necrovore", :per_page => 10, :type => :artist)
#  p search
# count = 0 
# File.readlines("/Users/davidaugustine/Desktop/artists.csv").each do |line|
#   artist = line.split(',')[0]