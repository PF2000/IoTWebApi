class CreateSchoolYears < ActiveRecord::Migration[5.0]
  def change
    create_table :school_years do |t|
      t.string :description
      t.datetime :startTime
      t.datetime :endTime

      t.timestamps
    end
  end
end
