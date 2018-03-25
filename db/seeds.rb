# # # require "discogs-wrapper"
# # #

# # # count = 0
# # # arrays = CSV.read("/Users/davidaugustine/Desktop/artists.csv", "rb")
# # # start = false
# # # arrays.each do |array|
# # #   puts array[0]
# # #   if array[0].strip == "Sixto Rodriguez"
# # #     start = true
# # #   end
# # #   if start
# # #     sleep(3.0)
# # #     search  = wrapper.search(array[0], :per_page => 1, :type => :artist)
# # #     if search.results.length > 0
# # #       artist_id = search.results.first.id
# # #       artist  = wrapper.get_artist(artist_id)
# # #       puts artist_id
# # #       puts artist.name
# # #       puts artist.profile
# # #       if !Artist.find_by(name: artist.name) 
# # #         Artist.create(name: artist.name, bio: artist.profile, discogs_ref: artist_id)
# # #       end
# # #     end
# # #   end
# # # end
# # # count = 0
# # # artists = Artist.all 
# # # artists.each do |artist|
# # #   if artist.id > 2452
# # #     puts artist.name
# # #     artist_ref = artist.discogs_ref
# # #     releases = wrapper.get_artist_releases(artist_ref, :per_page => 200).releases
# # #     if releases 
# # #       releases.each do |release|
# # #         if release.artist == artist.name
# # #           if release.main_release
# # #             record = wrapper.get_release(release.main_release)
# # #             sleep(0.9)
# # #             if record.tracklist
# # #               if record.tracklist.length > 5
# # #                 track_names = ""
# # #                 puts record.title
# # #                 record.tracklist.each do |track|
# # #                   if track_names == ""
# # #                     track_names = track.title
# # #                   else
# # #                     track_names += ", #{track.title}"
# # #                   end
# # #                 end
# # #                 if !Record.find_by(title: record.title)
# # #                   new_record = Record.create(title: record.title, tracklist: track_names, release_year: release.year,discogs_album_ref: release.main_release)
# # #                   ArtistRecord.create(artist_id: artist.id, record_id: new_record.id)
# # #                   if record.styles 
# # #                     record.styles.each do |style|
# # #                       if !Genre.find_by(name: style)
# # #                         Genre.create(name: style)
# # #                       end
# # #                       genre = Genre.find_by(name: style)
# # #                       RecordGenre.create(record_id: new_record.id, genre_id: genre.id)
# # #                     end
# # #                   end
# # #                 end
# # #               end
# # #             end
# # #           end
# # #         end
# # #       end
# # #     end
# # #   end
# # #   # count += 1
# # #   # if count > 1
# # #   #   break
# # #   # end
# # # end

# # # artists = Artist.all 
# # # artists.each do |artist|
# # #   sleep(0.9)
# # #   puts artist.name 
# # #   discogs_artist = wrapper.get_artist("#{artist.discogs_ref}")
# # #   if discogs_artist.images
# # #     image_url = discogs_artist.images[0].resource_url
# # #     if !ArtistImage.find_by(image_url: image_url)
# # #       puts image_url
# # #       puts artist.id
# # #       ArtistImage.create(image_url: image_url, artist_id: artist.id)
# # #     end
# # #   end
# # # end

# # # records = Record.all 
# # # records.each do |record|
# # #   if record.id > 21164
# # #     sleep(0.9)
# # #     puts record.title 
# # #     discogs_record = wrapper.get_release("#{record.discogs_album_ref}")
# # #     if discogs_record.images
# # #       image_url = discogs_record.images[0].resource_url
# # #       if !Image.find_by(image_url: image_url)
# # #         puts image_url
# # #         puts record.id
# # #         Image.create(image_url: image_url, record_id: record.id)
# # #       end
# # #     end
# # #   end
# # # end

# # UserRecord.create(record_id: 109,
# #                   price: 20,
# #                   user_id: 1,
# #                   status: 0
# #                   )

# # UserRecord.create(record_id: 111,
# #                   price: 25,
# #                   user_id: 1,
# #                   status: 0
# #                   )

# # UserRecord.create(record_id: 1942,
# #                   price: 12,
# #                   user_id: 1,
# #                   status: 0
# #                   )

# # UserRecord.create(record_id: 1945,
# #                   price: 30,
# #                   user_id: 1,
# #                   status: 1
# #                   )

# User.all.each do |user|
#       if user.id != 1 && user.id != 2 && user.id != 25
#             user.destroy
#       end
# end
