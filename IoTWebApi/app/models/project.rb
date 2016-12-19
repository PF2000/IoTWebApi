class Project < ApplicationRecord
  belongs_to :discipline

#overrides the sets
	def discipline=(params)
		@discipline = Discipline.find( params[:id])	
		super(@discipline)
	end

	#Overrides the Gets
	def discipline	
		super
 	end

end
