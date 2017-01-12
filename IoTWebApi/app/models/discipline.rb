class Discipline < ApplicationRecord
	has_and_belongs_to_many :courses
	has_many :school_classes, :dependent => :destroy

  	validates :name, presence: {message: 'Please provide a discipline name'}

	def courses=(params)
		@cor = [];
		params.each do |courseID|
		     @cor << Course.find( courseID[:id] )
		end 		
		super(@cor)	
	end

	#Overrides the Gets
	def courses
		super
 	end
end




# {
#   "discipline":
#   {
#     "name": "Teste",
#     "courses":
#      [
#      {"id": "31"},
#      {"id": "32"}
#    	]
#   }
# }