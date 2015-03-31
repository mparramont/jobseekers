class CreateEmployments < ActiveRecord::Migration
  def change
    create_table :employments do |t|
      t.string :title
      t.text :description
      t.text :key_skills
      t.datetime :date
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :employments, :users
  end
end
