
namespace :importdata do

require 'csv'

desc "Import teams from csv file"
task :import => [:environment] do

  file = "C:/fivehotellist.csv"

  CSV.foreach(file, :headers => true) do |row|
    Hotel.create {
      :EANHotelID => row[1],
      :StarRating => row[2]
    }

end
end
end
##http://railsguides.net/how-to-generate-rake-task/
