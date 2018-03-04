class AddDiscogsRefToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :discogs_album_ref, :integer
  end
end
