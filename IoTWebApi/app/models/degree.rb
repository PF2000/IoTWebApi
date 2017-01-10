class Degree < ApplicationRecord
	#has_many :courses
	#belongs_to :courses
  	validates :description, presence: { message: 'Please provide a degree description'}
end
