class AddDetailsToPlanes < ActiveRecord::Migration[6.0]
  def change
    add_column :planes, :plane_age, :string
    add_column :planes, :production_line, :string
  end
end
