class City < ApplicationRecord

  has_many :temperatures, class_name: "Temperature"
  validates_presence_of  :name, :code
  scope :find_codes, -> { all.collect { |obj| obj.code } }

end
