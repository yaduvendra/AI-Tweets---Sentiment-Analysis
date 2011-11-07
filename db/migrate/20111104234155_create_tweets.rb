class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :body
      t.integer :to_user_id
      t.integer :from_user_id
      t.datetime :time
      t.integer :brand_id

      t.timestamps
    end
  end
end
