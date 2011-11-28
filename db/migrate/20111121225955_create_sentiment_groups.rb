class CreateSentimentGroups < ActiveRecord::Migration
  def change
    create_table :sentiment_groups do |t|
      t.string :name, :null => false

      t.timestamps
    end
  end
end
