class Hunt < ActiveRecord::Base
  attr_accessible :name, :status, :user_id, :aquisition_strategy, :target_location, :goal, :price_max, :price_min, :target_purchase_discount_percent, :target_rent_weekly, :down_payment_percent, :interest_rate_annual, :origination_fee, :stamp_duty_rate, :closing_costs_misc_fee, :vacancyloss_percent, :accounting, :advertising, :bankcharges, :electricity, :gas, :home_owner_association_fees, :insurance_hazard, :insurance_mortgage, :landscape_maintenance, :legal, :maintenance, :property_management_percent, :miscellaneous_fee, :permits, :pest_termite_control, :phone, :postage, :referrals_commissions, :reserves, :supplies_maintenance, :supplies_office, :taxes_property, :warranties, :water_sewer

  belongs_to :user

  has_many :hunt_properties
  has_many :properties, :through => :hunt_properties

  has_many :hunt_streets
  has_many :streets, :through => :hunt_streets
end
