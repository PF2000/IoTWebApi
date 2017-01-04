class CreateAttaches < ActiveRecord::Migration[5.0]
  def change
    create_table :attaches do |t|
      t.string :name
      t.string :data
      t.string :data_type
      t.string :description
      t.datetime :date
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
