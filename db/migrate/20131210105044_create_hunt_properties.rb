class CreateHuntProperties < ActiveRecord::Migration
  def change
    create_table :hunt_properties do |t|
      t.integer :property_id
      t.string :status
      t.integer :rating
      t.integer :hunt_id

      t.timestamps
    end
  end
end
