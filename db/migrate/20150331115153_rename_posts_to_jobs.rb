class RenamePostsToJobs < ActiveRecord::Migration
  def change
    rename_table :posts, :jobs
  end
end
