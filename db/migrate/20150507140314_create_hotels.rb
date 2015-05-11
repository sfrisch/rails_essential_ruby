class CreateHotels < ActiveRecord::Migration
  def change
    create_table :hotels do |t|
      t.integer :EANHotelID
      t.integer :ChainCodeID
      t.integer :RegionID
      t.decimal :Latitude
      t.decimal :Longitude
      t.decimal :StarRating
      t.decimal :PropertyCategory
      t.decimal :HighRate
      t.decimal :LowRate
      t.string :AirportCode
      t.string :City
      t.string :Address1
      t.string :Address2
      t.string :City
      t.string :Location
      t.string :Name
      t.string :PostalCode
      t.string :StateProvince
      t.string :PropertyCurrency

      t.timestamps null: false
    end
  end
end
