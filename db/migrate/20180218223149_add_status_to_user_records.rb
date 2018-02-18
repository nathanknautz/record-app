class AddStatusToUserRecords < ActiveRecord::Migration[5.1]
  def change
    add_column :user_records, :status, :integer
  end
end
