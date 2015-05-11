

require 'date'
require 'json'
require 'open-uri'
#require 'xmlsimple'
#require 'nokogiri'
#require 'active_support/core_ext/hash'
#require 'xpath'


url = "http://api.ean.com/ean-services/rs/hotel/v3/avail?cid=55505&minorRev=28&apiKey=cbrzfta369qwyrm9t5b8y8kf&locale=en_EN&_type=json&currencyCode=USD&customerIpAddress=10.187.20.19&customerUserAgent=Mozilla/5.0+(Windows+NT+6.1)+AppleWebKit/537.36+(KHTML,+like+Gecko)+Chrome/42.0.2311.135+Safari/537.36&customerSessionId=0ABAAA48-36A9-1691-4D22-6DCC95E913AA&xml=<HotelRoomAvailabilityRequest>
<hotelId>234548</hotelId>
<arrivalDate>5/28/2015</arrivalDate>
<departureDate>5/30/2015</departureDate>
<RoomGroup>
<Room>
<numberOfAdults>
</numberOfAdults>
</Room>
</RoomGroup>
<includeRoomImages>true</includeRoomImages>
</HotelRoomAvailabilityRequest>"


url2 = URI.encode(url)
jsonfeed = open(url2).read
hotelhash = JSON.parse(jsonfeed)


puts hotelhash['HotelRoomAvailabilityResponse']['HotelRoomResponse']

