require 'rails_helper'

RSpec.describe ManagerWeatherMap do


  describe 'find_last_register' do
    let!(:city_1) { create(:city, name: "Santiago", code: "3873544") }
    let!(:city_2) { create(:city, name: "Buenos Aires", code: "3435910") }
    let(:mwm) { ManagerWeatherMap.new}

    it 'perfect update' do
    	mwm.update
      expect(Temperature.count).to eql( 2)
    end
  end


  describe 'find_last_register incorrect' do
    let!(:city_invalidate_1) { create(:city, name: "Venezuela", code: "chevezcandanga") }
    let!(:city_invalidate_2) { create(:city, name: "Maduro", code: "burro") }
   	let(:mwm) { ManagerWeatherMap.new}
    it 'incorrect register ' do
      mwm.update
      expect(Temperature.count).to eql( 0 )
    end
  end



end
