class CreateArtistImages < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_images do |t|
      t.string :image_url

      t.timestamps
    end
  end
end
