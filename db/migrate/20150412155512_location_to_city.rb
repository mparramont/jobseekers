class LocationToCity < ActiveRecord::Migration
  def change
    remove_column :users, :location, :string
    remove_column :jobs, :location, :string
    add_column :users, :city, :string
    add_column :jobs, :city, :string
  end
end
