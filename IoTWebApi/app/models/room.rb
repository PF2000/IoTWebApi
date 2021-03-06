class Room < ApplicationRecord
	belongs_to :school

  	validates :description, presence: { message: 'Please provide a room description'}

	#overrides the sets
	def school=(params)
		@school = School.find( params[:id])	
		super(@school)
	end

	#Overrides the Gets
	def school	
		super
 	end
end

