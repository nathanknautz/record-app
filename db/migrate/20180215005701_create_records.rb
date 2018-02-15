class CreateRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :records do |t|
      t.date :release_date
      t.string :title
      t.integer :playtime
      t.text :record_information

      t.timestamps
    end
  end
end
