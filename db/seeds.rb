
user1 = User.create :email => "jane@jane.com", :password => "555555555"

streets = ['n4 2lx', 'n1 8af', 'E8 4PH']
streets.each do |street|
  Street.create(:postcode => street)
end

bundle exec rake zoopla:import_data 
