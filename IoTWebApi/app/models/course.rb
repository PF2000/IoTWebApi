class Course < ApplicationRecord
	belongs_to :school
	belongs_to :degree, :foreign_key => 'degree_id', :class_name => 'Degree'

    has_and_belongs_to_many :disciplines
    has_and_belongs_to_many :school_years

	#overrides the sets
	def school=(params)
		@school = School.find( params[:id])	
		super(@school)
	end

	def degree=(params)
		@degree = Degree.find( params[:id])	
		super(@degree)
	end

	def disciplines=(params)
		@dis = [];
		params.each do |disciplineId|
		     @dis << Discipline.find( disciplineId[:id] )
		end 		
		super(@dis)	
	end

	def school_years=(params)
		@sy = [];
		params.each do |school_yearsId|
		     @sy << School_Years.find( school_yearsId[:id] )
		end 		
		super(@sy)	
	end

	#Overrides the Gets
	def school	
		super
 	end
	def degree		
		super
 	end
	def disciplines		
		super
 	end

 	def school_years		
		super
 	end

end

#POST
# {
#   "course":
#   {
#     "name": "inf",
#     "school":
#     {
#     	"id": "10"
#      },
#      "degree":
#      {
#     	"id": "16"
#      },
#      "disciplines":
#      [
#     	{"id": "31"},
#     	{"id": "32"}
#   	]
#   }
# }

