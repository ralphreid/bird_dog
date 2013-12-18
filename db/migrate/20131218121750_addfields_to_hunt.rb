class AddfieldsToHunt < ActiveRecord::Migration
  def change
    add_column :hunts, :target_location, :string
    add_column :hunts, :goal, :string
    add_column :hunts, :aquisition_strategy, :string
    add_column :hunts, :price_max, :integer
    add_column :hunts, :price_min, :integer
    add_column :hunts, :target_purchase_discount_percent, :decimal
    add_column :hunts, :target_rent_weekly, :integer
    add_column :hunts, :down_payment_percent, :decimal
    add_column :hunts, :interest_rate_annual, :decimal
    add_column :hunts, :origination_fee, :integer
    add_column :hunts, :stamp_duty_rate, :decimal
    add_column :hunts, :closing_costs_misc_fee, :integer
    add_column :hunts, :vacancyloss_percent, :decimal
    add_column :hunts, :accounting, :integer
    add_column :hunts, :advertising, :integer
    add_column :hunts, :bankcharges, :integer
    add_column :hunts, :electricity, :integer
    add_column :hunts, :gas, :integer
    add_column :hunts, :home_owner_association_fees, :integer
    add_column :hunts, :insurance_hazard, :integer
    add_column :hunts, :insurance_mortgage, :integer
    add_column :hunts, :landscape_maintenance, :integer
    add_column :hunts, :legal, :integer
    add_column :hunts, :maintenance, :integer
    add_column :hunts, :property_management_percent, :integer
    add_column :hunts, :miscellaneous_fee, :integer
    add_column :hunts, :permits, :integer
    add_column :hunts, :pest_termite_control, :integer
    add_column :hunts, :phone, :integer
    add_column :hunts, :postage, :integer
    add_column :hunts, :referrals_commissions, :integer
    add_column :hunts, :reserves, :integer
    add_column :hunts, :supplies_maintenance, :integer
    add_column :hunts, :supplies_office, :integer
    add_column :hunts, :taxes_property, :integer
    add_column :hunts, :warranties, :integer
    add_column :hunts, :water_sewer, :integer
  end
end




