class SchoolClass < ApplicationRecord
	belongs_to :discipline
	belongs_to :room
	belongs_to :school_year

	#overrides the sets
	def discipline=(params)
		@discipline = Discipline.find( params[:id])	
		super(@discipline)
	end

	def room=(params)
		@room = Room.find( params[:id])	
	 	super(@room)
	end

	def school_year=(params)
		#debugger
		@school_year = SchoolYear.find( params[:id])	
	 	super(@school_year)
	end


	# #Overrides the Gets
	def room	
	 	super
	end

	def discipline	
		super
	end
	
	def school_year	
		super
	end

	
end
