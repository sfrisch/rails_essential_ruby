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
 timestamp = Time.now.to_i.to_s
@signature = Digest::MD5.hexdigest( '5vbhuthojstbnn6jueqqnff8j8'+'fl4rmem2fjkao'+timestamp)
hotel = params["hotelid"]
@checkin = params["checkin"]
@checkout = params["checkout"]
@adults = params["adults"].to_i
@children = params["children"].to_i
@age1 = params["age1"].to_i
@age2 = params["age2"].to_i
@age3 = params["age3"].to_i

@agelist = [@age1,@age2,@age3]

@agestring= ""

@agelist.each do |age|
if @agestring == "" then
  @agestring = age.to_s
else
@agestring = @agestring.to_s + "," + age.to_s
end
end



room_search = "http://api.ean.com/ean-services/rs/hotel/v3/avail?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&_type=json&currencyCode=USD&xml=<HotelRoomAvailabilityRequest>
<hotelId>#{hotel}</hotelId>
<arrivalDate>#{@checkin}</arrivalDate>
<departureDate>#{@checkout}</departureDate>
<RoomGroup>
<Room>
<numberOfAdults>#{@adults}</numberOfAdults>
<numberOfChildren>#{@children}</numberOfChildren>
<childAges>#{@agestring}</childAges>
</Room>
</RoomGroup>
<includeRoomImages>true</includeRoomImages>
<options>HOTEL_DETAILS,ROOM_TYPES,ROOM_AMENITIES,PROPERTY_AMENITIES</options>
</HotelRoomAvailabilityRequest>"


room_search2 = URI.encode(room_search)
jsonfeed2 = open(room_search2).read
@roomhash = JSON.parse(jsonfeed2)



hotel_detail ="http://api.ean.com/ean-services/rs/hotel/v3/avail?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&currencyCode=USD&xml=<HotelRoomAvailabilityRequest><hotelId>#{hotel}</hotelId><arrivalDate>#{@checkin}</arrivalDate><departureDate>#{@checkout}</departureDate><RoomGroup><Room><numberOfAdults>#{@adults}</numberOfAdults><numberOfChildren>#{@children}</numberOfChildren><childAges>#{@agestring}</childAges></Room></RoomGroup><includeRoomImages>true</includeRoomImages><options>HOTEL_IMAGES</options></HotelRoomAvailabilityRequest>"


hotel_detail2 = URI.encode(hotel_detail)
jsonfeed3 = open(hotel_detail2).read
@hoteldetailhash = JSON.parse(jsonfeed3)


hotel_summary ="http://api.ean.com/ean-services/rs/hotel/v3/info?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&_type=json&currencyCode=USD&xml=<HotelInformationRequest>
<hotelId>#{hotel}</hotelId>
<options>0</options>
</HotelInformationRequest>"


hotel_summary2 = URI.encode(hotel_summary)
jsonfeedsum = open(hotel_summary2).read
@hotelsummary = JSON.parse(jsonfeedsum)


render('hoteldetails.html.erb')

end














def hotelwherever

 timestamp = Time.now.to_i.to_s
@signature = Digest::MD5.hexdigest( '5vbhuthojstbnn6jueqqnff8j8'+'fl4rmem2fjkao'+timestamp )


require 'open-uri'
require 'date'


@random = rand



@checkin =  params['checkin']
@checkout = params['checkout']
@roomhash = {}
@city = params['city']
@hotelslist = []
@stars = params['stars'].to_f
@adults = params['adults']
@children = params['children']
@region = params['region']
@countrylist = []
@chain = params['brand']
@temp = params['temp']
@hoteltype = params['hoteltype']
@age1 = params["age1"].to_i
@age2 = params["age2"].to_i
@age3 = params["age3"].to_i
@searchstring = params["searchstring"].to_i

if @pricerange != nil then

@pricerange = params["pricerange"]
@pricerange2 = @pricerange.split(",")
@maxprice = @pricerange2[1].to_i
@minprice = @pricerange2[0].to_i
end

#@searchstring = @checkin.to_s + "|" + @checkout.to_s + "|" + @region.to_s + "|" + @chain.to_s + "|" + @temp.to_s + "|" + @hoteltype.to_s + "|" + @minprice.to_s + "|" + @maxprice.to_s + "|" + @adults.to_s + "|" + @children.to_s + "|" + @age1.to_s + "|"+ @age2.to_s + "|"+ @age3.to_s


@agelist = [@age1,@age2,@age3]

@agestring= ""

@agelist.each do |age|
if @agestring == "" then
  @agestring = age.to_s
else
@agestring = @agestring.to_s + "," + age.to_s
end
end



case @temp when "90F+" then 90
  when "80F+" then 80
    when "70F+" then 70
      when "60F+" then 60
        when "50F+" then 50
        end


if @checkin == nil then


else


@pricerange = params["pricerange"]
@pricerange2 = @pricerange.split(",")
@maxprice = @pricerange2[1].to_i
@minprice = @pricerange2[0].to_i


if @region != "Any" then

sql = "SELECT \"Code\" FROM countries where \"Area\" = '#{@region}'"

conn = ActiveRecord::Base.connection
@countries = ActiveRecord::Base.connection.execute sql

else
sql = "SELECT \"Code\" FROM countries"

conn = ActiveRecord::Base.connection
@countries = ActiveRecord::Base.connection.execute sql

end



if @chain != "Any" then
 sql = "SELECT \"ChainID\" FROM chain where \"ChainName\" = '#{@chain}'"

@chainid = ActiveRecord::Base.connection.execute(sql)
@chainid = @chainid[0]["ChainID"]

else
  @chainid = "\"ChainCodeID\""
end


@countries.each do |country|
  @countrylist.push(country['Code'])
end

@countrylist =  @countrylist.map(&:strip).join("','")

if @hoteltype == "-1" then
  @hoteltypeid = "\"PropertyCategory\""
else
  @hoteltypeid = @hoteltype
end


sql = "SELECT \"EANHotelID\" FROM hotels where \"Country\" IN ('#{@countrylist}') AND \"LowRate\" <= #{@maxprice} AND \"ChainCodeID\" = #{@chainid} AND \"StarRating\" >= #{@stars} AND \"PropertyCategory\" = #{@hoteltypeid}"

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

@hotelslist =@hotelslist.map(&:strip).join(', ')




sql = "SELECT hotels.\"EANHotelID\",airport_lat_long.\"LAT\",airport_lat_long.\"LONG\" FROM hotels INNER JOIN airport_lat_long ON airport_lat_long.\"AIRPORT\" = hotels.\"AirportCode\" INNER JOIN hoteltemp ON hotels.\"EANHotelID\" = hoteltemp.\"eanhotelid\""


@get_latlong = ActiveRecord::Base.connection.execute(sql)


          hotel_search = "http://api.ean.com/ean-services/rs/hotel/v3/list?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&_type=json&currencyCode=USD&xml=<HotelListRequest><arrivalDate>#{@checkin}</arrivalDate><departureDate>#{@checkout}</departureDate><RoomGroup><Room><numberOfAdults>#{@adults}</numberOfAdults><numberOfChildren>#{@children}</numberOfChildren><childAges>#{@agestring}</childAges></Room></RoomGroup><hotelIdList>#{@hotelslist}</hotelIdList><minStarRating>4</minStarRating><maxRate>#{@maxprice}</maxRate><minRate>#{@minprice}</minRate><supplierCacheTolerance>MED_ENHANCED</supplierCacheTolerance></HotelListRequest>"



          hotel_search2 = URI.encode(hotel_search)
          @jsonfeed = open(hotel_search2).read
          @hotelhash = JSON.parse(@jsonfeed)

  @baserate = []
  @hotelname = []
  hashresults = {}
  @coordarray = []
  @check = nil
  @hotelhash3 = {'HotelListResponse'=> {'HotelList' => {"HotelSummary"=>[]}}}

begin

if @hotelhash["HotelListResponse"]["HotelList"]["@size"] == "1" then

@hotelhash3["HotelListResponse"]["HotelList"]["HotelSummary"].push(@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"])
@hotelhash = @hotelhash3
 end

@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"].each do |geo|
  @coordarray.push([geo["latitude"],  geo["longitude"],geo["name"]])
end


@sum = 0.0
@sum2 = 0.0
@coordarray.each do |avg|

@sum = avg[0] + @sum
@sum2 = avg[1] + @sum2
end

@centerlat = @sum / @coordarray.length
@centerlong = @sum2 / @coordarray.length


@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"]


rescue

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



def contactus
render('contactus.html.erb')
end





#TOTAL PRICE DAT
##<dd class="totalprice"><%= number_to_currency(zebra["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@total"])%></dd>

#<dd><%= number_to_currency(zebra["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@averageRate"])%><span> X </span>
#<%= zebra["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["NightlyRatesPerRoom"]["@size"]%><span> Nights = </span>
#<%= number_to_currency(zebra["RateInfos"]["RateInfo"]["ChargeableRateInfo"]["@nightlyRateTotal"])%></dd>
