class CreateArtistRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :artist_records do |t|
      t.integer :artist_id
      t.integer :record_id

      t.timestamps
    end
  end
end
