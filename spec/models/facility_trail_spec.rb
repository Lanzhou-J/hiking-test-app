require 'rails_helper'

RSpec.describe FacilityTrail, type: :model do
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:facility_trail)).to be_valid
    end
  end

  context 'associations' do
    it { expect(subject).to belong_to(:trail)}
    it { expect(subject).to belong_to(:facility)}
  end
end
