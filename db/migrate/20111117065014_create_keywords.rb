class CreateKeywords < ActiveRecord::Migration
  def change
    create_table :keywords do |t|
      t.string :value, :null => false
      t.integer :brand_id, :null => false
      t.boolean :active, :default => true

      t.timestamps
    end
  end
end
