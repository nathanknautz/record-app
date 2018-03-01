class UpdatePriceInUserRecordsToDecimal < ActiveRecord::Migration[5.1]
  def change
    change_column :user_records, :price, :decimal, precision: 6, scale: 2
  end
end
