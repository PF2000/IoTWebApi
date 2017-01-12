class Project < ApplicationRecord
  belongs_to :discipline
  belongs_to :school_year

#overrides the sets
	def discipline=(params)
		@discipline = Discipline.find( params[:id])	
		super(@discipline)
	end

	def school_year=(params)
		@school_year = SchoolYear.find( params[:id])	
		super(@school_year)
	end

	#Overrides the Gets
	def discipline	
		super
 	end

 	def school_year	
		super
 	end

end
