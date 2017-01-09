class Summary < ApplicationRecord
	belongs_to :school_class

	def school_class=(params)
		debugger
		@school_class = SchoolClass.find( params[:id])	
	 	super(@school_class)
	end

	# #Overrides the Gets
	def school_class	
	 	super
	end
end
