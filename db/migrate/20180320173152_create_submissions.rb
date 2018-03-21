class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.references :assignment, foreign_key: true
      t.string :image_data
      t.string :url

      t.timestamps
    end
  end
end
