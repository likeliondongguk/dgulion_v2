class AddContentToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :content, :text
  end
end
