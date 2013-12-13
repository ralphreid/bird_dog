require 'httparty'


namespace :zoopla do

  desc "import zoopla data"
  task import_data: :environment do
    begin 
      response = HTTParty.get("http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=n4&api_key=ENV['ZOOPLA_KEY']")
      listing = response["listing"]

      p = Property.new 
      p.source = 'zoopla'
      # p.property_page = result["property_page"]
      # property_source_id = /property_id=(\d*)/.match p.property_page
      # p.property_source_id = property_source_id[1]
      
      # p.type_listing = 'to rent'
      
      # # p.rent = result['rent']
      # p.rent_frequency = result["rent_frequency"]

      # p.save!
    rescue => e 
      puts "something went wrong! #{e}"
    end
  end
end