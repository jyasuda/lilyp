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

ActiveRecord::Schema.define(:version => 20100803052321) do

  create_table "attributes", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attributes_products", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "care_instructions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "care_instructions_products", :id => false, :force => true do |t|
    t.integer "care_instruction_id"
    t.integer "product_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.string   "singular_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_products", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "constructions", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "constructions_products", :id => false, :force => true do |t|
    t.integer "construction_id"
    t.integer "product_id"
  end

  create_table "groupings", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupings_products", :id => false, :force => true do |t|
    t.integer "grouping_id"
    t.integer "product_id"
  end

  create_table "photos", :force => true do |t|
    t.string   "caption"
    t.string   "source"
    t.integer  "sort"
    t.integer  "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end

  create_table "photos_products", :id => false, :force => true do |t|
    t.integer "photo_id"
    t.integer "product_id"
  end

  create_table "products", :force => true do |t|
    t.text     "description"
    t.date     "startDate"
    t.string   "size_id"
    t.integer  "style_id"
    t.integer  "primaryCategory_id"
    t.decimal  "price",              :precision => 8, :scale => 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "products_type_of_fits", :id => false, :force => true do |t|
    t.integer "category_id"
    t.integer "product_id"
  end

  create_table "sizes", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "styles", :force => true do |t|
    t.string   "name"
    t.string   "urlname"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "type_of_fits", :force => true do |t|
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
