class Facility < ApplicationRecord
  validates :name, presence: true, length: {in: 3..55}
end
