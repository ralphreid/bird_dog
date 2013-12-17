#Rake::Task['zoopla:import_data'].invoke()


namespace :zoopla do

  desc "import zoopla data"
  task import_data: :environment do
    begin
      postcode = 'n4'
      page_number = 1
      query = "http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=#{postcode}&page_size=100&page_number=#{page_number}&api_key=#{ENV['ZOOPLA_KEY']}"
      response = HTTParty.get(query)
      result_count = response["result_count"]
      page_count = (result_count / 100.0).ceil 
      page_count.times do |page_index|
        page_number = page_index + 1
        response = HTTParty.get(query)
        listings = response["listing"]
        listings.each do |listing|
          p = Property.new 
          p.source = 'zoopla'
          p.image_caption = listing['image_caption']

          p.status = listing['status']
          p.num_floors = listing['num_floors']
          p.listing_status = listing['listing_status']
          p.num_bedrooms = listing['num_bedrooms']
          p.agent_name = listing['agent_name']
          p.latitude = listing['latitude']
          p.agent_address = listing['agent_address']
          p.num_recepts = listing['num_recepts']
          p.property_type = listing['property_type']
          p.country = listing['country']
          p.longitude = listing['longitude']
          p.first_published_date = listing['first_published_date']
          p.displayable_address = listing['displayable_address']
          p.street_name = listing['street_name']
          p.num_bathrooms = listing['num_bathrooms']
          p.thumbnail_url = listing['thumbnail_url']
          p.description = listing['description']
          p.post_town = listing['post_town']
          p.details_url = listing['details_url']
          p.agent_logo = listing['agent_logo']
          p.short_description = listing['short_description']
          p.agent_phone = listing['agent_phone']
          p.outcode = listing['outcode']
          p.image_url = listing['image_url']
          p.last_published_date = listing['last_published_date']
          p.county = listing['county']
          p.price = listing['price']
          p.listing_id = listing['listing_id']

          p.save!
        end
      end
    rescue => e
      puts "somthing when wrong! #{e}"
    end
  end
end