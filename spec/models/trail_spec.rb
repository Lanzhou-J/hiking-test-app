require 'rails_helper'

RSpec.describe Trail, type: :model do
  subject {build(:trail)}
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it 'has many FacilityTrails' do
      
    end
  end
end
