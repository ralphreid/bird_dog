class CreateHuntStreets < ActiveRecord::Migration
  def change
    create_table :hunt_streets do |t|
      t.integer :street_id
      t.string :status
      t.integer :rating
      t.integer :hunt_id

      t.timestamps
    end
  end
end
