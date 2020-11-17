class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :planes, :type, :name
  end
end
