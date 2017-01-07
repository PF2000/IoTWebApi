class AddReferenceToProject < ActiveRecord::Migration[5.0]
  def change
    add_reference :projects, :schoolyear, foreign_key: true
  end
end
