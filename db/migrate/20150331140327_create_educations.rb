class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.string :name
      t.datetime :date
      t.string :institution
      t.string :grade
      t.text :description
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :educations, :users
  end
end
