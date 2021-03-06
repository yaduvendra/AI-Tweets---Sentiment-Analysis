# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20111121230048) do

  create_table "brands", :force => true do |t|
    t.string   "name",                             :null => false
    t.string   "twitter_handle",                   :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",         :default => true
    t.string   "last_max_id",    :default => "0",  :null => false
    t.string   "state",                            :null => false
  end

  add_index "brands", ["name"], :name => "index_brands_on_name"
  add_index "brands", ["twitter_handle"], :name => "index_brands_on_twitter_handle", :unique => true

  create_table "keywords", :force => true do |t|
    t.string   "value",                        :null => false
    t.integer  "brand_id",                     :null => false
    t.boolean  "active",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentiment_group_members", :force => true do |t|
    t.integer  "brand_id",           :null => false
    t.integer  "sentiment_group_id", :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentiment_groups", :force => true do |t|
    t.string   "name",       :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sentiments", :force => true do |t|
    t.integer  "brand_id",                                                             :null => false
    t.integer  "timestamp",                                                            :null => false
    t.integer  "num_tweets",                                                           :null => false
    t.decimal  "total_score",            :precision => 10, :scale => 0, :default => 0, :null => false
    t.integer  "num_positive",                                          :default => 0, :null => false
    t.integer  "num_negative",                                          :default => 0, :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "normalized_total_score", :precision => 10, :scale => 0, :default => 0, :null => false
  end

  add_index "sentiments", ["brand_id", "timestamp"], :name => "index_sentiments_on_brand_id_and_timestamp", :unique => true

  create_table "tweets", :force => true do |t|
    t.text     "body"
    t.integer  "to_user_id"
    t.integer  "from_user_id"
    t.datetime "time"
    t.integer  "brand_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tweet_id",     :null => false
  end

  add_index "tweets", ["tweet_id"], :name => "index_tweets_on_tweet_id", :unique => true

end
