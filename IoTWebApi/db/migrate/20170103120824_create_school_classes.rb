class CreateSchoolClasses < ActiveRecord::Migration[5.0]
  def change
    create_table :school_classes do |t|
      t.string :description
      t.datetime :startTime
      t.datetime :endTime
      t.string :classLetter
      t.string :classType
      t.string :professor
      t.references :discipline, foreign_key: true
      t.references :room, foreign_key: true

      t.timestamps
    end
  end
end
