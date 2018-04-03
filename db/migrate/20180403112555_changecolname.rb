class Changecolname < ActiveRecord::Migration[5.1]
  def change
    rename_column :users, :image, :image_data
  end
end
