
user = User.create! :email => "jane@jane.com", :password => "5555duke"

hunt = Hunt.create!(name: 'Hunt for Killer 1-Beds with Parking')
user.hunts << hunt


postcodes = ['n4 2lx', 'n1 8af', 'E2 4PH']
postcodes.each do |p|
  street = Street.create(:postcode => p)
  HuntStreet.create!({
    street_id: street.id, 
    hunt_id: hunt.id
    })
end

