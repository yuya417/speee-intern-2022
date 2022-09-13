class Branch < ApplicationRecord
  belongs_to :company
  belongs_to :city
  has_many :available_areas, dependent: :restrict_with_exception
  has_many :reviews, dependent: :destroy
  has_many :cities, through: :available_areas
end
