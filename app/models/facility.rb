class Facility < ApplicationRecord
  validates :name, presence: true, length: {in: 3..55}
  has_many :facility_trails
  has_many :trails, through: :facility_trails
end
