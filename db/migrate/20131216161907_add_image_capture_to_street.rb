class AddImageCaptureToStreet < ActiveRecord::Migration
  def change
    add_column :streets, :image_capture, :string
  end
end
