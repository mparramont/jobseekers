class AddEndDateToExperience < ActiveRecord::Migration
  def change
    remove_column :educations, :date, :datetime
    add_column :educations, :start_date, :date
    add_column :educations, :end_date, :date
  end
end
