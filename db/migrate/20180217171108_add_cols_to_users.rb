class AddColsToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_index :users, :name
    add_column :users, :grade, :integer
    add_column :users, :desc, :text
  end
end
