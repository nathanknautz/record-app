class RemoveArtistIdFromImages < ActiveRecord::Migration[5.1]
  def change
    remove_column :images, :artist_id
  end
end
