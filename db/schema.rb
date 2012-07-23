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

ActiveRecord::Schema.define(:version => 20120720145542) do

  create_table "blog_statuses", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "color",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "blog_statuses", ["name"], :name => "index_blog_statuses_on_name", :unique => true

  create_table "blogs", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "url",              :null => false
    t.integer  "blog_statuses_id", :null => false
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "news", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "news", ["title"], :name => "index_news_on_title"

  create_table "options", :force => true do |t|
    t.string   "name",       :null => false
    t.string   "value",      :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "options", ["name"], :name => "index_options_on_name", :unique => true

  create_table "page_informations", :force => true do |t|
    t.string   "title"
    t.string   "content"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_informations", ["title", "page_id"], :name => "index_page_informations_on_title_and_page_id", :unique => true

  create_table "page_links", :force => true do |t|
    t.string   "title"
    t.string   "url"
    t.integer  "page_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_links", ["title", "page_id"], :name => "index_page_links_on_title_and_page_id", :unique => true

  create_table "page_types", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "page_types", ["name"], :name => "index_page_types_on_name", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.string   "image"
    t.integer  "ptype_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["title"], :name => "index_pages_on_title"

  create_table "widgets", :force => true do |t|
    t.string   "title",      :null => false
    t.text     "content",    :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "widgets", ["title"], :name => "index_widgets_on_title"

end
