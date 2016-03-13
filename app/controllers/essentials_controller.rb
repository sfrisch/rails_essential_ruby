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

if @counter == nil then
@counter = 1
end


@counter =  params['counter'].to_i
@checkin =  params['checkin']
@checkout = params['checkout']
@roomhash = {}
@city = params['city']
@hotelslist = []
@stars = params['stars'].to_f
@adults = params['adults']
@children = params['children'].to_i
@region = params['region']
@countrylist = []
@chain = params['brand']
@temp = params['temp']
@hoteltype = params['hoteltype']
@age1 = params["age1"].to_i
@age2 = params["age2"].to_i
@age3 = params["age3"].to_i
@searchstring = params["searchstring"].to_i
@filterresults = params["filterresults"]
@get_latlong = []
@firstformtoggle = 1
@filterresults = 14
@sorting = 0
@hoteltype = params[:hoteltype]
@temp = params[:temp]
@stars = params[:stars].to_i

if @filterresults == nil then
  @filterresults = 14
end


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


sql = "SELECT \"EANHotelID\" FROM hotels where \"Country\" IN ('#{@countrylist}') AND \"LowRate\" <= #{@maxprice} AND \"ChainCodeID\" = #{@chainid} AND \"StarRating\" >= #{@stars} AND \"PropertyCategory\" = #{@hoteltypeid} ORDER BY \"HighRate\" DESC"

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






if @hotelslist.count > 50 then
    @hotelslist = @hotelslist[0..49]
end


ActiveRecord::Base.connection.execute("BEGIN TRANSACTION;")

@hotelslist.each do |hotel|

  @hotelstring = "(" + hotel.to_s + ")"
sqlinsert = "INSERT INTO hoteltemp(EANHotelID) VALUES #{@hotelstring};"
ActiveRecord::Base.connection.execute(sqlinsert)

end


ActiveRecord::Base.connection.execute("COMMIT;")




@hotelslist =@hotelslist.map(&:strip).join(', ')




if @hotelslist == nil || @hotelslist == ''
  then @check = "No Results Available - Please broaden your search" and @hotelslist = '000000'

end






sql = "SELECT hotels.\"EANHotelID\",countries.\"Code\",countries.\"Area\",\"ChainCodeID\",airport_lat_long.\"LAT\",airport_lat_long.\"LONG\" FROM hotels INNER JOIN airport_lat_long ON airport_lat_long.\"AIRPORT\" = hotels.\"AirportCode\" INNER JOIN hoteltemp ON hotels.\"EANHotelID\" = hoteltemp.\"eanhotelid\" INNER JOIN countries ON countries.\"Code\" = hotels.\"Country\" WHERE hoteltemp.\"eanhotelid\" IN (#{@hotelslist})"



@latlongs = ActiveRecord::Base.connection.execute(sql)


 @latlongs.each do |latlong|

     @get_latlong.push({"EANHotelID" => latlong["EANHotelID"],"LAT" => latlong["LAT"],"LONG" => latlong["LONG"],"ChaincodeID" => latlong["ChainCodeID"],"Region" => latlong["Area"].strip})

         end



          hotel_search = "http://api.ean.com/ean-services/rs/hotel/v3/list?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&_type=json&currencyCode=USD&xml=<HotelListRequest><arrivalDate>#{@checkin}</arrivalDate><departureDate>#{@checkout}</departureDate><RoomGroup><Room><numberOfAdults>#{@adults}</numberOfAdults><numberOfChildren>#{@children}</numberOfChildren><childAges>#{@agestring}</childAges></Room></RoomGroup><hotelIdList>#{@hotelslist}</hotelIdList><minStarRating>4</minStarRating><maxRate>#{@maxprice}</maxRate><minRate>#{@minprice}</minRate><supplierCacheTolerance>MED_ENHANCED</supplierCacheTolerance></HotelListRequest>"

          hotel_search2 = URI.encode(hotel_search)
          @jsonfeed = open(hotel_search2).read
          @hotelhash = JSON.parse(@jsonfeed)

  @baserate = []
  @hotelname = []
  hashresults = {}
  @coordarray = []
  @tripresults2 = []
  @tripreviews2 = []
  @check = nil
  @hotelhash3 = {'HotelListResponse'=> {'HotelList' => {"HotelSummary"=>[]}}}


begin

if @hotelhash["HotelListResponse"]["HotelList"]["@size"] == "1" then

@hotelhash3["HotelListResponse"]["HotelList"]["HotelSummary"].push(@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"])
@hotelhash = @hotelhash3
 end



 sql = "SELECT \"ChainID\",\"ChainName\" FROM chain"
@chains = ActiveRecord::Base.connection.execute(sql)

@chainid = []
 @chains.each do |chain|

     @chainid.push({"ChainID" => chain["ChainID"],"ChainName" => chain["ChainName"].strip})

         end



@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"]


if @hotelhash["HotelListResponse"]["cacheLocation"] == nil then


else



        @pagecount = @hotelhash["HotelListResponse"]["cachedSupplierResponse"]["@cacheEntryMissNum"].to_i / 20


for i in 1..@pagecount




        if i == 1 then
        @cachelocation = @hotelhash["HotelListResponse"]["cacheLocation"]
        @cachekey = @hotelhash["HotelListResponse"]["cacheKey"]
else
        @cachelocation = @moreresults["HotelListResponse"]["cacheLocation"]
        @cachekey = @moreresults["HotelListResponse"]["cacheKey"]
      end



        moreresults = "http://api.ean.com/ean-services/rs/hotel/v3/list?cid=489058&minorRev=28&apiKey=5vbhuthojstbnn6jueqqnff8j8&sig=#{@signature}&locale=en_GB&_type=json&currencyCode=USD&xml=<HotelListRequest><cacheKey>#{@cachekey}</cacheKey><cacheLocation>#{@cachelocation}</cacheLocation></HotelListRequest>"


                  moreresults2 = URI.encode(moreresults)
                  @jsonfeed5 = open(moreresults2).read
                  @moreresults = JSON.parse(@jsonfeed5)

                if @moreresults["HotelListResponse"]["cachedSupplierResponse"] == nil then else

          for t in 0..@moreresults["HotelListResponse"]["cachedSupplierResponse"]["@supplierResponseNum"].to_i-1


           @hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"].push(@moreresults["HotelListResponse"]["HotelList"]["HotelSummary"][t])

              end

end


end


end



#@hotelhash["HotelListResponse"]["HotelList"]["HotelSummary"].each do |geo|
#
#          @coordarray.push([geo["latitude"],  geo["longitude"],geo["name"]])#
#
 #       tripadvisorurl = "http://api.tripadvisor.com/api/partner/2.0/location_mapper/#{geo["latitude"]},#{geo["longitude"]}?key=db62f2a733a040b1b4e0ebdac4e8aac8-mapper&category=hotels&q=#{geo["name"]}"

  #               trip1 = URI.encode(tripadvisorurl)

   #               @jsonfeed6 = open(trip1).read
    #              @tripresults = JSON.parse(@jsonfeed6)

     #             if @tripresults["data"] == [] then else
      #            @tripresults2.push(@tripresults["data"][0]["location_id"],geo["hotelId"],geo["name"])

       #     tripadvisorlookup = "http://api.tripadvisor.com/api/partner/2.0/location/#{@tripresults["data"][0]["location_id"]}?key=db62f2a733a040b1b4e0ebdac4e8aac8"

        #         trip2 = URI.encode(tripadvisorlookup)
         #         @jsonfeed7 = open(trip2).read
          #        @tripreviews = JSON.parse(@jsonfeed7)

#if @tripreviews == nil then

 #                 geo["rank"] = ""
  #                geo["reviews"] = ""
   #               geo["rating_image_url"] = ""
    #              geo["num_reviews"] = ""
     #             geo["web_url"] = ""
      #            geo["write_reviews"] = ""
#else
#
 #                 geo["rank"] = @tripreviews["ranking_data"]["ranking_string"]
  #                geo["reviews"] = @tripreviews["reviews"]
   #               geo["rating_image_url"] = @tripreviews["rating_image_url"]
    #              geo["num_reviews"] = @tripreviews["num_reviews"]
     #             geo["web_url"] = @tripreviews["web_url"]
      #            geo["write_reviews"] = @tripreviews["write_review"]
       #         end

#end
#end


#@sum = 0.0
#@sum2 = 0.0
#@coordarray.each do |avg|

#@sum = avg[0] + @sum
#@sum2 = avg[1] + @sum2
#end

#@centerlat = @sum / @coordarray.length
#@centerlong = @sum2 / @coordarray.length




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

                  when @hotelhash == nil then @check ="No Available Hotels"


 else
              @check = "Please enter date in DD/MM/YYYY format"


   end

   end

   end

if @check == nil then
  @counter = @counter + 1
end


    render('test.html.erb')

  end




def filter


  @filterresults = params[:filterresults]
  @get_latlong = params[:get_latlong].gsub!(/\"/, '\'')
  @checkin = params[:checkin]
  @chainid = params[:chainid]
  @checkout = params[:checkout]
  @firstformtoggle = params[:firstformtoggle]
         @pricea = params[:pricea]
         @priceb = params[:priceb]
         @pricec = params[:pricec]
         @priced = params[:priced]
         @pricee = params[:pricee]
         @pricef = params[:pricef]
            @pricerange = params[:pricerange]
         @brandstring = params[:brandstring]
          @whotels = params[:whotels]
          @hyatt = params[:hyatt]
           @fourseasons = params[:fourseasons]
           @hilton = params[:hilton]
           @radissonblu = params[:radissonblu]
           @renaissance = params[:renaissance]
           @sheraton = params[:sheraton]
           @stregis = params[:stregis]
           @westin = params[:westin]
           @waldorf = params[:waldorf]
           @boscolo = params[:boscolo]
           @fairmont = params[:fairmont]
           @intercontinental = params[:intercontinental]
           @jwmarriott = params[:jwmarriott]
           @mandarin = params[:mandarin]
           @marriott = params[:marriott]
           @melia = params[:melia]
           @shangra = params[:shangra]
           @sofitel = params[:sofitel]
           @starwoodlux = params[:starwoodlux]
           @swisshotel = params[:swisshotel]
           @langham = params[:langham]
           @peninsula = params[:peninsula]
           @lemeridian = params[:lemeridian]
            @coordarray = params[:coordarray]
            @centerlat= params[:centerlat]
            @centerlong = params[:centerlong]
            @sorting = params[:sorting].to_i
            @hoteltype = params[:hoteltype]
              @temp = params[:temp]
                @stars = params[:stars].to_i
              @us = params[:us]
           @europe = params[:europe]
            @canada = params[:canada]
           @southamerica = params[:southamerica]
           @asia = params[:asia]
            @africa = params[:africa]
            @australia= params[:australia]
            @middleeast = params[:middleeast]
            @latin = params[:latin]
            @regionstring = params[:regionstring]




@children = params['children'].to_i
@age1 = params["age1"].to_i
@age2 = params["age2"].to_i
@age3 = params["age3"].to_i



@price_a = 0
@price_b = 0
@price_c = 0
@price_d = 0
@price_e = 0
@price_f = 0


    if @pricea == 'true' then @price_a = 1 and @pricea=true else @pricea = false end
      if @priceb == 'true' then @price_b = 1 and @priceb=true else @priceb = false end
        if @pricec == 'true' then @price_c = 1  and @pricec=true else @pricec = false end
          if @priced == 'true' then @price_d = 1 and @priced=true else @priced = false end
            if @pricee == 'true' then @price_e = 1 and @pricee=true else @pricee = false end
              if @pricef == 'true' then @price_f = 1 and @pricef=true else @pricef = false end
                if @whotels == 'true'then @whotels=true else @whotels = false end
                   if @hyatt == 'true' then @hyatt=true else @hyatt = false end
                     if @fourseasons == 'true'then @fourseasons=true else @fourseasons = false end
                     if @hilton == 'true' then @hilton=true else @hilton = false end
                     if @radissonblu == 'true' then @radissonblu=true else @radissonblu = false end
                     if @renaissance == 'true' then @renaissance=true else @renaissance = false end
                     if @sheraton == 'true' then @sheraton=true else @sheraton = false end
                     if @stregis == 'true' then @stregis=true else @stregis = false end
                     if @westin == 'true' then @westin=true else @westin = false end
                     if @waldorf == 'true'then @waldorf=true else @waldorf = false end
                     if @boscolo == 'true'then @boscolo=true else @boscolo = false end
                     if @fairmont == 'true'then @fairmont=true else @fairmont = false end
                     if @intercontinental == 'true'then @intercontinental=true else @intercontinental = false end
                     if @jwmarriott == 'true'then @jwmarriott=true else @jwmarriott = false end
                     if @mandarin == 'true'then @mandarin=true else @mandarin = false end
                     if @marriott == 'true'then @marriott=true else @marriott = false end
                     if @melia == 'true'then @melia=true else @melia = false end
                     if @shangra == 'true'then @shangra=true else @shangra = false end
                     if @sofitel == 'true'then @sofitel=true else @sofitel = false end
                     if @starwoodlux == 'true'then @starwoodlux=true else @starwoodlux = false end
                     if @swisshotel == 'true'then @swisshotel=true else @swisshotel = false end
                     if @langham == 'true' then @langham=true else @langham = false end
                     if @peninsula == 'true' then @peninsula=true else @peninsula = false end
                     if @lemeridian == 'true'then @lemeridian=true else @lemeridian = false end

                     if @us == 'true'then @us=true else @us = false end
                     if @europe == 'true'then @europe=true else @europe = false end
                     if @asia == 'true'then @asia=true else @asia = false end
                     if @africa == 'true'then @africa=true else @africa = false end
                     if @australia == 'true'then @australia=true else @australia = false end
                     if @latin == 'true'then @latin=true else @latin = false end
                     if @southamerica == 'true' then @southamerica=true else @southamerica = false end
                     if @canada == 'true' then @canada=true else @canada = false end
                     if @middleeast == 'true'then @middleeast=true else @middleeast = false end




if @brandstring == nil then @brandstring = [] end
  if @regionstring == nil then @regionstring = [] end


@brandchecked = @whotels || @hyatt || @fourseasons || @hilton || @radissonblu || @renaissance || @sheraton || @stregis || @westin || @waldorf || @boscolo || @fairmont || @intercontinental || @jwmarriott || @mandarin || @marriott || @melia || @shangra || @sofitel || @starwoodlux || @swisshotel || @langham || @peninsula || @lemeridian

@pricechecked = @pricea || @priceb || @pricec || @priced || @pricee || @pricef

if @pricechecked == false and @brandchecked == false and @regionchecked = false then @firstformtoggle == 1 end


@regionchecked = @us || @europe || @latin || @canada || @middleeast || @africa || @asia || @southamerica || @australia

if @pricechecked == false and @brandchecked == false and @regionchecked == false then @firstformtoggle = 1 end




if @price_a.to_i + @price_b.to_i + @price_c.to_i + @price_d.to_i + @price_e.to_i + @price_f.to_i + @brandstring.count.to_i + @regionstring.count.to_i == 0 then @firstformtoggle = 1 else @firstformtoggle = 0 end



  @hotelhash = eval(params[:hotelhash])

  #@hotelhash = eval(params[:hotelhash].gsub!(/\"/, '\''))  maybe ?

  @check = nil
@LAT = 50
@LONG = 30



  respond_to do |format|
    format.js {}
  end
end

##format.html {render :partial => "accordianload", :layout => false}

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
