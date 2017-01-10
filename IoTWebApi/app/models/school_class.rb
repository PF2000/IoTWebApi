class SchoolClass < ApplicationRecord
	belongs_to :discipline
	belongs_to :room
	belongs_to :school_year

  	validates :description, presence: { message: 'Please provide a School class description'}
  	validates :description, start_time:{ message: 'Please provide a School class  start time'}
  	validates :description, end_time: {message: 'Please provide a School class  end time'}
  	validates :description, class_letter: {message: 'Please provide a School class  letter'}
  	validates :description, class_type: {message: 'Please provide a School class  type'}
  	validates :description, professor: {message: 'Please provide a School class  professor'}
  	validates :description, discipline_id: {message: 'Please provide a School class  discipline id'}
  	validates :description, room_id: {message: 'Please provide a School class  roomm id'}

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
