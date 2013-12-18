#Rake::Task['zoopla:import_data'].invoke()


namespace :zoopla do

  def build_query(postcode, page_number)
    "http://api.zoopla.co.uk/api/v1/property_listings.json?postcode=#{postcode}&page_size=100&page_number=#{page_number}&api_key=#{ENV['ZOOPLA_KEY']}"
  end

  desc "import zoopla data"
  task import_data: :environment do
    begin
      postcode = 'n4'
      page_number = 1
      query = build_query(postcode, page_number)
      response = HTTParty.get(query)
      result_count = response["result_count"]
      page_count = (result_count / 100.0).ceil 
      page_count.times do |page_index|
        page_number = page_index + 1
        query = build_query(postcode, page_number)
        response = HTTParty.get(query)
        listings = response["listing"]
        listings.each do |listing|

          details_url = listing['details_url']

          p = Property.find_or_create_by_details_url_and_source(details_url, 'zoopla')

          p.update_attributes(
            source: 'zoopla',
            image_caption: listing['image_caption'],
            status: listing['status'],
            num_floors: listing['num_floors'],
            listing_status: listing['listing_status'],
            num_bedrooms: listing['num_bedrooms'],
            agent_name: listing['agent_name'],
            latitude: listing['latitude'],
            agent_address: listing['agent_address'],
            num_recepts: listing['num_recepts'],
            property_type: listing['property_type'],
            country: listing['country'],
            longitude: listing['longitude'],
            first_published_date: listing['first_published_date'],
            displayable_address: listing['displayable_address'],
            street_name: listing['street_name'],
            num_bathrooms: listing['num_bathrooms'],
            thumbnail_url: listing['thumbnail_url'],
            description: listing['description'],
            post_town: listing['post_town'],
            details_url: listing['details_url'],
            agent_logo: listing['agent_logo'],
            short_description: listing['short_description'],
            agent_phone: listing['agent_phone'],
            outcode: listing['outcode'],
            image_url: listing['image_url'],
            last_published_date: listing['last_published_date'],
            county: listing['county'],
            price: listing['price'],
            listing_id: listing['listing_id']
          ) 
          p.save!         
        end
      end
    rescue => e
      puts "somthing when wrong! #{e}"
    end
    
  end
end