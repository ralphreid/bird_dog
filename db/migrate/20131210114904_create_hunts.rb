class CreateHunts < ActiveRecord::Migration
  def change
    create_table :hunts do |t|
      t.string :name
      t.integer :user_id
      t.string :status

      t.timestamps
    end
  end
end
