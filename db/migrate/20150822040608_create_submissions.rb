class CreateSubmissions < ActiveRecord::Migration
  def change
    create_table :submissions do |t|
      t.string :name
      t.string :email
      t.string :title
      t.text :abstract
      t.string :type
      t.text :dietary_restrictions

      t.timestamps null: false
    end
  end
end
