class Discipline < ApplicationRecord
	has_and_belongs_to_many :courses
	has_many :school_classes

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