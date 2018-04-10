class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :image_data
      t.text :content

      t.timestamps
    end
  end
end
