class CreateScomments < ActiveRecord::Migration[5.1]
  def change
    create_table :scomments do |t|
      t.references :submission, foreign_key: true
      t.references :user, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
