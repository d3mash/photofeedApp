class Photo < ApplicationRecord
	validates :link, presence: true
end
