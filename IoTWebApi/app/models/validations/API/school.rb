class School < ApplicationRecord
	has_many :courses
	has_many :rooms
	validates_associated :course
end
