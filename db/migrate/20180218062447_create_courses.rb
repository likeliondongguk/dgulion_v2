class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.references :curri, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :position
      t.boolean :main
      t.string :title
      t.string :video
      t.string :image
      t.text :content
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :courses, :position
    add_index :courses, :title
    add_index :courses, :deleted_at
  end
end
