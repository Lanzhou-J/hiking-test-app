require 'rails_helper'

RSpec.describe Trail, type: :model do
  subject {
    Trail.new(
      name: 'Test Trail',
      distance: 100,
      difficulty: 3
    )
  }
  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end
end
