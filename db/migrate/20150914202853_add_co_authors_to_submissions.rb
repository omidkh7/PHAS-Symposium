class AddCoAuthorsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :co_authors, :string
  end
end
