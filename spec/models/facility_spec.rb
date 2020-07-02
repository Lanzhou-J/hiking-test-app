require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject {build(:facility)}
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:facility)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name)}

    it { expect(subject).to validate_length_of(:name).is_at_least(3).is_at_most(55)}
  end

  context 'association' do
    it { expect(subject).to have_many(:trails).through(:facility_trails)}
  end
end

