class AddReferenceToSchoolClass < ActiveRecord::Migration[5.0]
  def change
    add_reference :school_classes, :school_year, foreign_key: true
  end
end
