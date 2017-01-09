class CreateSummaries < ActiveRecord::Migration[5.0]
  def change
    create_table :summaries do |t|
      t.integer :number_students
      t.string :description
      t.datetime :date
      t.references :school_class, foreign_key: true

      t.timestamps
    end
  end
end
