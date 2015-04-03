class AddFieldsToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :keywords, :text
    add_column :jobs, :location, :string
    add_column :jobs, :job_length, :integer
    add_column :jobs, :job_type, :integer
    add_column :jobs, :suitable_for_graduates, :boolean
    add_reference :jobs, :category, index: true
    add_foreign_key :jobs, :categories
    add_column :jobs, :salary, :integer
    add_column :jobs, :reference, :string
  end
end
