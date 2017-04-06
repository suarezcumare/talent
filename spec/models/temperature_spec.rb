require 'rails_helper'

RSpec.describe Temperature, type: :model do
  it { should belong_to(:city) }
  it { should validate_presence_of(:temp) }
  it { should validate_presence_of(:temp_min) }
  it { should validate_presence_of(:temp_max) }

   

  #scope :find_lasts, -> { last_temperatures.reverse }
  describe 'find_lasts' do
    let!(:temperatures) {create_list(:temperature, 2)}

    it 'temperature ' do
      expect(Temperature.find_lasts.first.id).to eql( temperatures.reverse.first.id )
      expect(Temperature.find_lasts.last.id).to eql( temperatures.reverse.last.id )
    end

    it 'not temperatures ' do
    	Temperature.destroy_all
      expect(Temperature.find_lasts).to eql( [])
    end
  end


  #scope :find_last_register, -> { last }
  describe 'find_last_register' do
    let!(:temperatures) {create_list(:temperature, 2)}

    it 'not register ' do
      expect(Temperature.find_last_register.id).to eql( temperatures.last.id)
    end

    it 'register ' do
      Temperature.destroy_all
      expect(Temperature.find_last_register.count).to eql( 0)
    end
  end

  describe 'is_update?' do
  	let!(:temperature) { create(:temperature) }

    it 'register ' do
      expect(Temperature.is_update?).to eql( false )
    end

    it 'not register ' do
      Temperature.destroy_all
      expect(Temperature.is_update?).to eql(true)
    end
  end

end
