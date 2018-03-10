class AddArtistIdToArtistImage < ActiveRecord::Migration[5.1]
  def change
    add_column :artist_images, :artist_id, :integer
  end
end
