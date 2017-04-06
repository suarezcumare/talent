require 'rails_helper'

RSpec.describe City, type: :model do


  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
   end

  #scope :find_codes, -> { all.collect { |obj| obj.code } }
  describe 'find_lasts' do
    let!(:cities) {create_list(:city, 2)}

    it 'not codes ' do
      expect(City.find_codes).to eql( cities.collect { |obj| obj.code })
    end

    it 'codes ' do
    	City.destroy_all
      expect(City.find_codes).to eql( [])
    end
  end


  


end
