require 'rails_helper'

RSpec.describe Temperature, type: :model do
  it { should belong_to(:city) }
  it { should validate_presence_of(:temp) }
  it { should validate_presence_of(:temp_min) }
  it { should validate_presence_of(:temp_max) }

  let!(:temperature) { create(:temperature) }
 

  describe 'is_update?' do

  end

end
