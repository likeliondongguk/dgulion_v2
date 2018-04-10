class CreateEcomments < ActiveRecord::Migration[5.1]
  def change
    create_table :ecomments do |t|
      t.references :event, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end
