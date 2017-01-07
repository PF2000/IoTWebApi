class AddReferenceToSchoolClass < ActiveRecord::Migration[5.0]
  def change
    add_reference :school_classes, :schoolyear, foreign_key: true
  end
end
