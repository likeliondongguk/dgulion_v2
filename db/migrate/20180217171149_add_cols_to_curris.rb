class AddColsToCurris < ActiveRecord::Migration[5.1]
  def change
    add_column :curris, :desc, :text
  end
end
