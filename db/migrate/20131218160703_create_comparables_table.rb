class CreateComparablesTable < ActiveRecord::Migration
  def up
    create_table :comparables, id: false do |t| 
      t.integer :property_buy_id
      t.integer :property_comparable_id
    end
  end

  def down
    delete_table :comparables
  end
end
