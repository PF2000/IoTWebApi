class Summary < ApplicationRecord
	belongs_to :school_class

  	validates :number_students, presence: {message: 'Please provide the number of students that atended'}
  	validates :description, presence: {message: 'Please provide description'}
  	validates :date, presence: {message: 'Please provide a date'}
  	validates :school_class_id, presence: {message: 'Please provide a school class id'}

	def school_class=(params)
		# debugger - comentado para conseguir correr seeds
		@school_class = SchoolClass.find( params[:id])	
	 	super(@school_class)
	end

	# #Overrides the Gets
	def school_class	
	 	super
	end
end
