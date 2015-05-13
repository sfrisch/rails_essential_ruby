class EssentialsController < ApplicationController





  def basics_1
    # Strings, integers, variables
    # Simple methods, string interpolation

    # The essential pattern in Ruby:
    #    variable = object.method
    first = "raghu".capitalize
    last = "betina".capitalize

    full = first + " " + last
    lucky_number = rand(1..100) + 7

    # Adding strings together with the + operator
    @message1 = "Howdy, " + full + ". Your lucky number for today is " + lucky_number.to_s + "."
    # is harder than with String Interpolation
    @message2 = "Howdy, #{full}. Your lucky number for today is #{lucky_number}."

    render('basics_1.html.erb')
  end

  def arrays_2
    # Arrays

    # Creating Arrays
    @students = ["Jocelyn", "Trenton", "Tom", "Lindsey"]

    # Adding an element to an Array:
    @students.push("Roz")

    render('arrays_2.html.erb')
  end

  def hashes_3
    # Hashes

    # Creating Hashes
    @person1 = { "first_name" => "Raghu", "last_name" => "Betina" }
    @person2 = { "first_name" => "Michael", "last_name" => "Arthur" }

    # Adding a key/value pair to a Hash:
    @person2["role"] = "Student"
    @person1["role"] = "Instructor"

    render('hashes_3.html.erb')
  end

  def nested_lists_4
    # Nested Arrays and Hashes

    rb = { "first_name" => "Raghu",     "last_name" => "Betina" }
    av = { "first_name" => "Arjun",     "last_name" => "Venkataswamy" }
    dy = { "first_name" => "Dan",       "last_name" => "Yu" }
    gn = { "first_name" => "Genevieve", "last_name" => "Nielsen" }
    an = { "first_name" => "Alex",      "last_name" => "Niemczewski" }
    mg = { "first_name" => "Marina",    "last_name" => "Goldshteyn" }
    ms = { "first_name" => "Marty",     "last_name" => "Stratton" }

    @instructors = [rb, av, dy, gn, an, mg, ms]

    render('nested_lists_4.html.erb')
  end




def hoteldetails
require 'date'
require 'open-uri'

hotel = params["hotelid"]
@checkin = params["checkin"]
@checkout = params["checkout"]
@adults = params["adults"]

room_search = "http://api.ean.com/ean-services/rs/hotel/v3/avail?cid=55505&minorRev=28&apiKey=cbrzfta369qwyrm9t5b8y8kf&locale=en_EN&_type=json&currencyCode=USD&customerIpAddress=10.187.20.19&customerUserAgent=Mozilla/5.0+(Windows+NT+6.1)+AppleWebKit/537.36+(KHTML,+like+Gecko)+Chrome/42.0.2311.135+Safari/537.36&customerSessionId=0ABAAA48-36A9-1691-4D22-6DCC95E913AA&xml=<HotelRoomAvailabilityRequest>
<hotelId>#{hotel}</hotelId>
<arrivalDate>#{@checkin}</arrivalDate>
<departureDate>#{@checkout}</departureDate>
<RoomGroup>
<Room>
<numberOfAdults>
</numberOfAdults>
</Room>
</RoomGroup>
<includeRoomImages>true</includeRoomImages>
</HotelRoomAvailabilityRequest>"


room_search2 = URI.encode(room_search)
jsonfeed2 = open(room_search2).read
@roomhash = JSON.parse(jsonfeed2)



hotel_detail ="http://api.ean.com/ean-services/rs/hotel/v3/avail?cid=55505&minorRev=28&apiKey=cbrzfta369qwyrm9t5b8y8kf&locale=en_EN&currencyCode=USD&customerIpAddress=10.187.20.19&customerUserAgent=Mozilla/5.0+(Windows+NT+6.1)+AppleWebKit/537.36+(KHTML,+like+Gecko)+Chrome/42.0.2311.135+Safari/537.36&customerSessionId=0ABAAA4E-3EF4-5B91-4D42-AAC276090292&xml=<HotelRoomAvailabilityRequest><hotelId>#{hotel}</hotelId><arrivalDate>#{@checkin}</arrivalDate><departureDate>#{@checkout}</departureDate><RoomGroup><Room><numberOfAdults></numberOfAdults></Room></RoomGroup><includeRoomImages>true</includeRoomImages><options>HOTEL_IMAGES</options></HotelRoomAvailabilityRequest>"


hotel_detail2 = URI.encode(hotel_detail)
jsonfeed3 = open(hotel_detail2).read
@hoteldetailhash = JSON.parse(jsonfeed3)















render('hoteldetails.html.erb')


end














def hotelwherever

require 'open-uri'
require 'date'


@random = rand



@checkin =  params['checkin']
@checkout = params['checkout']
@roomhash = {}
@city = params['city']
@hotelslist = []
@stars = params['stars']
@adults = params['adults']
@region = params['region']
@countrylist = []
@chain = params['brand']

if @checkin == nil then


else


@pricerange = params["pricerange"]
@pricerange2 = @pricerange.split(",")
@maxprice = @pricerange2[1].to_i
@minprice = @pricerange2[0].to_i

sql = "SELECT Code FROM countries where Area == '#{@region}'"

@countries = ActiveRecord::Base.connection.execute(sql)


sql = "SELECT ChainID FROM chain where ChainName == '#{@chain}'"

@chainid = ActiveRecord::Base.connection.execute(sql)
@chainid = @chainid[0]["ChainID"]

@countries.each do |country|
  @countrylist.push(country['Code'])
end

@countrylist =  @countrylist.map(&:strip).join("','")

sql = "Select EANHotelID FROM hotels where Country IN ('#{@countrylist}') AND LowRate <= #{@maxprice} AND ChainCodeID IN (#{@chainid})"

@HotelIDS = ActiveRecord::Base.connection.execute(sql)


#@HotelIDS = Hotel.where({:Country => @countrylist AND :LowRate <= @minprice}).select{[:EANHotelID]}


   @HotelIDS.each do |hotelrow|

     @hotelslist.push(hotelrow["EANHotelID"])

         end


@hotelstring = ""
sqlinsert = ""



sqldrop = "DROP TABLE hoteltemp"
ActiveRecord::Base.connection.execute(sqldrop)
sqlcreate = "CREATE TABLE hoteltemp (EANHotelID int);"
ActiveRecord::Base.connection.execute(sqlcreate)




ActiveRecord::Base.connection.execute("BEGIN TRANSACTION;")

@hotelslist.each do |hotel|

  @hotelstring = "(" + hotel.to_s + ")"
sqlinsert = "INSERT INTO hoteltemp(EANHotelID) VALUES #{@hotelstring};"
ActiveRecord::Base.connection.execute(sqlinsert)

end


ActiveRecord::Base.connection.execute("COMMIT;")




if @hotelslist.count > 600 then
    @hotelslist = @hotelslist.sample(600)
end

@hotelslist =@hotelslist.map(&:inspect).join(', ')





sql = "SELECT hotels.EANHotelID,airport_lat_long.LAT,airport_lat_long.LONG FROM hotels,hoteltemp INNER JOIN airport_lat_long ON airport_lat_long.AIRPORT = hotels.AirportCode where hotels.EANHotelID = hoteltemp.EANHotelID"




@get_latlong = ActiveRecord::Base.connection.execute(sql)


          hotel_search = "http://api.ean.com/ean-services/rs/hotel/v3/list?cid=55505&minorRev=28&apiKey=cbrzfta369qwyrm9t5b8y8kf&locale=en_EN&_type=json&currencyCode=USD&customerIpAddress=10.187.20.19&customerUserAgent=Mozilla/5.0+(Windows+NT+6.1)+AppleWebKit/537.36+(KHTML,+like+Gecko)+Chrome/42.0.2311.90+Safari/537.36&customerSessionId=&xml=<HotelListRequest><arrivalDate>#{@checkin}</arrivalDate><departureDate>#{@checkout}</departureDate><RoomGroup><Room><numberOfAdults>#{@adults}</numberOfAdults></Room></RoomGroup><hotelIdList>#{@hotelslist}</hotelIdList><minStarRating>4</minStarRating><maxRate>#{@maxprice}</maxRate><minRate>#{@minprice}</minRate><supplierCacheTolerance>MED_ENHANCED</supplierCacheTolerance></HotelListRequest>"



          hotel_search2 = URI.encode(hotel_search)
          jsonfeed = open(hotel_search2).read
          @hotelhash = JSON.parse(jsonfeed)

  @baserate = []
  @hotelname = []
  hashresults = {}
  @check = nil


begin


     @hotelhash['HotelListResponse']['HotelList']['HotelSummary'].each do |zebra|

          ##Checks for data
         zebra["RoomRateDetailsList"]["RoomRateDetails"]["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@total"]
         num_of_hotels_returned = @hotelhash['HotelListResponse']['HotelList']['@activePropertyCount']


  end

rescue => e

  case        when @hotelhash["HotelListResponse"]["EanWsError"]["category"] == "SOLD_OUT"
                          @check = "SOLD OUT"

              when @hotelhash["HotelListResponse"]["EanWsError"]["presentationMessage"] == "Data in this request could not be validated: Check-in date must be prior to check-out date."

                         @check = "Check-in date must occur before Check-out date"

              when @hotelhash["HotelListResponse"]["EanWsError"]["presentationMessage"] == "Data in this request could not be validated: Specified arrival date is prior to today's date."

                         @check = "Arrival date is prior to today's date"

              when @hotelhash["HotelListResponse"]["EanWsError"]["presentationMessage"] == "Data in this request could not be validated: We cannot accept a reservation for longer than 30 days."

                        @check = "We cannot accept a reservation for longer than 30 days."

              when @hotelhash["HotelListResponse"]["EanWsError"]["presentationMessage"] == "No Results Available"

                        @check = "No Results Available"

                         when @hotelhash["HotelListResponse"]["EanWsError"]["presentationMessage"] == "Data in this request could not be validated: Specified city could not be resolved as valid location."

                        @check = "No Results Available ; Please broaden your search criteria"


 else
              @check = "Please enter date in DD/MM/YYYY format"


   end

   end

   end














    render('test.html.erb')

  end










  def each_5
    # Each

    @numbers = [3, 1, 5, 4]

    rb = { "first_name" => "Raghu",     "last_name" => "Betina" }
    av = { "first_name" => "Arjun",     "last_name" => "Venkataswamy" }
    dy = { "first_name" => "Dan",       "last_name" => "Yu" }
    mg = { "first_name" => "Marina",    "last_name" => "Goldshteyn" }
    gn = { "first_name" => "Genevieve", "last_name" => "Nielsen" }
    an = { "first_name" => "Alex",      "last_name" => "Niemczewski" }
    ms = { "first_name" => "Marty",     "last_name" => "Stratton" }

    @people = [rb, av, dy, mg, gn, an, ms]

    render('each_5.html.erb')
  end

  def silly_encrypt(the_string)
    return the_string.reverse.swapcase
  end

  def silly_decrypt(the_string)
    return the_string.swapcase.reverse
  end

  def methods_6
    @starting_string = "The Ability To Quote Is A Serviceable Substitute For Wit."

    @encrypted_string = silly_encrypt(starting_string)
    @decrypted_string = silly_decrypt(@encrypted_string)

    render('methods_6.html.erb')
  end

  def friendbc_11

    render('friendbc_11.html.erb')
  end
end



