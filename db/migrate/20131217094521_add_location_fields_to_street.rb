class AddLocationFieldsToStreet < ActiveRecord::Migration
  def change
    add_column :streets, :longitude, :decimal
    add_column :streets, :latitude, :decimal
    add_column :streets, :city, :string
    add_column :streets, :state, :string
    add_column :streets, :postal_code, :string
  end
end

