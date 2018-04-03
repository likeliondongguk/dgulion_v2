class AddColToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :title, :string
  end
end
