class AddTracklistToRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :records, :tracklist, :text
  end
end
