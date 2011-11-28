class CreateSentimentGroupMembers < ActiveRecord::Migration
  def change
    create_table :sentiment_group_members do |t|
      t.integer :brand_id, :null => false
      t.integer :sentiment_group_id, :null => false

      t.timestamps
    end
  end
end
