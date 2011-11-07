class ChangeTypeOfLastMaxIdForBrands < ActiveRecord::Migration
  def up
    change_column :brands, :last_max_id, :string
  end

  def down
  end
end
