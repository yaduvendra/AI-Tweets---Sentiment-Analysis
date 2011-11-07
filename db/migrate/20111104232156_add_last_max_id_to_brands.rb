class AddLastMaxIdToBrands < ActiveRecord::Migration
  def change
    add_column :brands, :last_max_id, :integer, :default => 0, :null => false
  end
end
