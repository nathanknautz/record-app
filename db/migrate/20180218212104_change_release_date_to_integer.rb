class ChangeReleaseDateToInteger < ActiveRecord::Migration[5.1]
  def change
    remove_column :records, :release_date
    add_column :records, :release_year, :integer
  end
end
