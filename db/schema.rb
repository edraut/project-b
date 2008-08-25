# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20080814181135) do

  create_table "attachments", :force => true do |t|
    t.integer  "attachable_id"
    t.string   "attachable_type"
    t.string   "type"
    t.integer  "size"
    t.integer  "width"
    t.integer  "height"
    t.string   "content_type"
    t.string   "filename"
    t.integer  "parent_id"
    t.string   "thumbnail"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "blog_entries", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "article_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_templates", :force => true do |t|
    t.string   "name"
    t.string   "path"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "body_template_path"
  end

  create_table "news_items", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "article_image_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_resources", :force => true do |t|
    t.string   "resource_type"
    t.integer  "resource_id"
    t.integer  "page_id"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "pages", :force => true do |t|
    t.string   "name"
    t.integer  "content_template_id"
    t.string   "type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.string   "client"
    t.text     "description"
    t.integer  "article_image_id"
    t.string   "site_link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "template_elements", :force => true do |t|
    t.string   "name"
    t.string   "type"
    t.integer  "content_template_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "text_elements", :force => true do |t|
    t.string   "name"
    t.text     "content"
    t.integer  "page_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
