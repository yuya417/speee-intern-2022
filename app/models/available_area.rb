# frozen_string_literal: true

class AvailableArea < ApplicationRecord
  belongs_to :branch
  belongs_to :city

  validates :city_id, uniqueness: { scope: :branch_id }
end
