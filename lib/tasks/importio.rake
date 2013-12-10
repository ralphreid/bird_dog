require 'importio'
require 'json' 


namespace :importio do

  desc "import importio data"
  task import_data: :environment do


    client = ImportIO::new(ENV['IMPORTIO_GUID'],ENV['IMPORTIO_KEY'])
    client.connect()

    # callback = lambda {|q,m| puts("\n\n\n"); pp m["data"]["results"] rescue nil}


    callback = lambda do |query,message| 
      if message["type"] == "MESSAGE"
        begin
          message["data"]["results"].each do |result|
            p = Property.new 

            p.property_page = result["property_page"]
            property_source_id = /property_id=(\d*)/.match p.property_page
            p.property_source_id = property_source_id[1]
            p.source = 'importio'
            p.type_listing = 'to rent'
            
            # p.rent = result['rent']
            p.rent_frequency = result["rent_frequency"]

            p.save!
          end
        rescue => e 
          puts "something went wrong! #{e}"
        end
      end
    end

    client.query({"input"=>{"location"=>"n1"},"connectorGuids"=>["edeb2716-1211-4d3c-9780-dd399aac9d37"]}, callback )
    client.join


  end
end