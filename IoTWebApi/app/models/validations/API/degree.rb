class Degree < ApplicationRecord
	#has_many :courses
	#belongs_to :courses
	attr_accessible :degree_id
    validates :degree_id, presence: true 
	validates_associated :courses
end
