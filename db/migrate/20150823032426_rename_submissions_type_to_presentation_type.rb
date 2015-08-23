class RenameSubmissionsTypeToPresentationType < ActiveRecord::Migration
  def change
    rename_column :submissions, :type, :presentation_type
  end
end
