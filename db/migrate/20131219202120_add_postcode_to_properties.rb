class AddPostcodeToProperties < ActiveRecord::Migration
  def change
    add_column :properties, :postcode, :string
  end
end
