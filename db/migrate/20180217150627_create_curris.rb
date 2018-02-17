class CreateCurris < ActiveRecord::Migration[5.1]
  def change
    create_table :curris do |t|
      t.string :title
      t.string :image

      t.timestamps
    end
    add_index :curris, :title
  end
end
