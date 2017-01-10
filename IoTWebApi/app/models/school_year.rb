class SchoolYear < ApplicationRecord
  	validates :description, presence: {message: 'Please provide a school year description'}
  	validates :start_time, presence: {message: 'Please provide a school year start time'}
  	validates :end_time, presence: {message: 'Please provide a school year end time'}

end
