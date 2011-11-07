class AddStateToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :state, :string, :null => false
  end
end
