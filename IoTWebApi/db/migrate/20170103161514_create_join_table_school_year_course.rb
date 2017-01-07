class CreateJoinTableSchoolYearCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :courses, :schoolyears do |t|
      # t.index [:course_id, :schoolyear_id]
      # t.index [:schoolyear_id, :course_id]
    end
  end
end
