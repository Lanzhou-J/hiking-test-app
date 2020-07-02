require 'rails_helper'

RSpec.describe Trail, type: :model do
  subject {build(:trail)}
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:trail)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name)}

    it { expect(subject).to validate_length_of(:name).is_at_least(8).is_at_most(75)}

    it { expect(subject).to validate_numericality_of(:distance).is_greater_than(0)}

    it { expect(subject).to validate_numericality_of(:difficulty).is_less_than_or_equal_to(5).is_greater_than_or_equal_to(1)}
    # it 'is not valid without a name' do
    #   subject.name = nil
    #   expect(subject).to_not be_valid
    # end
  end

  context 'associations' do
    it { expect(subject).to have_many(:facilities).through(:facility_trails) }
  end
end
