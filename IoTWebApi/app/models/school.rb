class School < ApplicationRecord
	has_many :courses
	has_many :rooms

  	# alguém se deve ter enganado a meter isto aqui:
  	# validates :description, presence: {message: 'Please provide a degree description'}
end
