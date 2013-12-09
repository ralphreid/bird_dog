class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :source
      t.string :type
      t.integer :rent
      t.string :rent_frequency
      t.text :property_page
      t.string :terms
      t.text :image_listing
      t.text :listing_blurb
      t.text :arrange_view_link

      t.timestamps
    end
  end
end
