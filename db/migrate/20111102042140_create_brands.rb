class CreateBrands < ActiveRecord::Migration
  def change
    create_table :brands do |t|
      t.string :name, :null => false
      t.string :twitter_handle, :null => false

      t.timestamps
    end

    add_index :brands, [:name]
    add_index :brands, [:twitter_handle], :unique => true
  end
end
