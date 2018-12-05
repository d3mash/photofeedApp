# frozen_string_literal: true

class Photo < ApplicationRecord
  validates :link, presence: true
end
