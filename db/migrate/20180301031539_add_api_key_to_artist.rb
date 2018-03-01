class AddApiKeyToArtist < ActiveRecord::Migration[5.1]
  def change
    add_column :artists, :discogs_ref, :integer
  end
end
