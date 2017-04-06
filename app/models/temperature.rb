class Temperature < ApplicationRecord

  belongs_to :city, class_name: "City"
  validates_presence_of  :temp_max, :temp_min, :temp

  scope :desc, ->  {order(created_at: :desc)}
  scope :num_cities, -> {City.all.count}
  scope :last_temperatures, -> { last( num_cities ) }
  scope :find_lasts, -> { last_temperatures.reverse }
  scope :find_last_register, -> { last }


  def self.is_update?
  	return self.find_last_register.created_at + 30.minutes < Time.now unless self.find_last_register.blank?
  	true
  end
end
