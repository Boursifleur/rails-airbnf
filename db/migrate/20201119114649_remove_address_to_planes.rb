class RemoveAddressToPlanes < ActiveRecord::Migration[6.0]
  def change
    remove_column :planes, :address, :string
  end
end
