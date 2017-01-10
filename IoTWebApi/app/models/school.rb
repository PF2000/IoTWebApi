class School < ApplicationRecord
	has_many :courses
	has_many :rooms

  	validates :description, presence: {message: 'Please provide a degree description'}
end
