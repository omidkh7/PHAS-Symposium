class AddFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :attender_type, :string
    add_column :submissions, :sub_department, :string
  end
end
