class CreateJoinTableSchoolYearCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :courses, :school_years do |t|
      # t.index [:course_id, :school_year_id]
      # t.index [:school_year_id, :course_id]
    end
  end
end
