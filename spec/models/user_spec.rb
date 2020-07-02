require 'rails_helper'

RSpec.describe User, type: :model do
  subject {build(:user)}
  context 'validations' do
    it 'has a valid factory' do
      expect(build(:user)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:username)}

  end

end
