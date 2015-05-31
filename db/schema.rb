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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150531174932) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "airport_lat_long", primary_key: "AIRPORT", force: :cascade do |t|
    t.float "LAT"
    t.float "LONG"
  end

  create_table "chain", primary_key: "ChainID", force: :cascade do |t|
    t.string "ChainName", limit: 255
  end

  create_table "countries", primary_key: "Code", force: :cascade do |t|
    t.string "Country", limit: 255
    t.string "Area",    limit: 255
  end

  create_table "hotels", primary_key: "EANHotelID", force: :cascade do |t|
    t.integer "SequenceNumber"
    t.string  "Name",             limit: 255
    t.string  "Address1",         limit: 255
    t.string  "Address2",         limit: 255
    t.string  "City",             limit: 255
    t.string  "StateProvince",    limit: 255
    t.string  "PostalCode",       limit: 255
    t.string  "Country",          limit: 255
    t.float   "Latitude"
    t.float   "Longitude"
    t.string  "AirportCode",      limit: 255
    t.integer "PropertyCategory"
    t.string  "PropertyCurrency", limit: 255
    t.float   "StarRating"
    t.string  "Confidence",       limit: 255
    t.string  "SupplierType",     limit: 255
    t.string  "Location",         limit: 255
    t.integer "ChainCodeID"
    t.integer "RegionID"
    t.float   "HighRate"
    t.float   "LowRate"
    t.float   "CheckInTime"
    t.float   "CheckOutTime"
  end

  create_table "hoteltemp", id: false, force: :cascade do |t|
    t.integer "eanhotelid"
  end

  create_table "test", id: false, force: :cascade do |t|
    t.text "EANHotelID,StarRating,AirportCode,RegionID,Country,ChainCodeID,"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "username"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
