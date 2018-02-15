class CreateUserRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :user_records do |t|
      t.integer :user_id
      t.integer :price
      t.integer :record_id

      t.timestamps
    end
  end
end
