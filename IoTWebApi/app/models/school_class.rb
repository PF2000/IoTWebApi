class SchoolClass < ApplicationRecord
	belongs_to :discipline
	belongs_to :room
	belongs_to :school_year

	#overrides the sets
	def discipline=(params)
		@discipline = Discipline.find( params[:id])	
		super(@discipline)
	end

	#Overrides the Gets
	def discipline	
		super
	end

	# def room=(params)
	# 	@room = Room.find( params[:id])	
	# 	super(@room)
	# end

	# #Overrides the Gets
	# def room	
	# 	super
	# end

end
