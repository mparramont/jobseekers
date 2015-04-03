class AddEndDateToEmployment < ActiveRecord::Migration
  def change
    remove_column :employments, :date, :datetime
    add_column :employments, :start_date, :date
    add_column :employments, :end_date, :date
  end
end
