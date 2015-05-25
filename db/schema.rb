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

ActiveRecord::Schema.define(version: 20150507140314) do

  create_table "airport_lat_long", primary_key: "AIRPORT", force: :cascade do |t|
    t.float "LAT"
    t.float "LONG"
  end

  add_index "airport_lat_long", ["AIRPORT"], name: "sqlite_autoindex_airport_lat_long_1", unique: true

  create_table "chain", primary_key: "ChainID", force: :cascade do |t|
    t.string "ChainName"
  end

  create_table "countries", primary_key: "Code", force: :cascade do |t|
    t.string "Country"
    t.string "Area"
  end

  add_index "countries", ["Code"], name: "sqlite_autoindex_countries_1", unique: true

  create_table "hotels", primary_key: "EANHotelID", force: :cascade do |t|
    t.integer "SequenceNumber"
    t.string  "Name"
    t.string  "Address1"
    t.string  "Address2"
    t.string  "City"
    t.string  "StateProvince"
    t.string  "PostalCode"
    t.string  "Country"
    t.float   "Latitude"
    t.float   "Longitude"
    t.string  "AirportCode"
    t.integer "PropertyCategory"
    t.string  "PropertyCurrency"
    t.float   "StarRating"
    t.string  "Confidence"
    t.string  "SupplierType"
    t.string  "Location"
    t.integer "ChainCodeID"
    t.integer "RegionID"
    t.float   "HighRate"
    t.float   "LowRate"
    t.float   "CheckInTime"
    t.float   "CheckOutTime"
  end

  create_table "hoteltemp", id: false, force: :cascade do |t|
    t.integer "EANHotelID"
  end

  create_table "test", id: false, force: :cascade do |t|
    t.text "EANHotelID,StarRating,AirportCode,RegionID,Country,ChainCodeID,Name,Address1,Address2,City,StateProvince,PostalCode,Latitude,Longitude,PropertyCategory,PropertyCurrency,Location,HighRate,LowRate,,"
  end

end
