class RemoveRecordInformationFromRecords < ActiveRecord::Migration[5.1]
  def change
    remove_column :records, :record_information
  end
end
