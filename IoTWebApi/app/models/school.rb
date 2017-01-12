class School < ApplicationRecord
	has_many :courses, :dependent => :destroy
	has_many :rooms,:dependent => :destroy

    validates :name, presence: {message: 'Please provide a school name'}
    validates :country, presence: {message: 'Please provide a school country'}
    validates :district, presence: {message: 'Please provide a school district'}
    validates :city, presence: {message: 'Please provide a school city'}
    validates :county, presence: {message: 'Please provide a school county'}
end
