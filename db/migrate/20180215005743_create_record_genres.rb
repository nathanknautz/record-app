class CreateRecordGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :record_genres do |t|
      t.integer :record_id
      t.integer :genre_id

      t.timestamps
    end
  end
end
