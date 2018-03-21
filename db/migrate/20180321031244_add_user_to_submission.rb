class AddUserToSubmission < ActiveRecord::Migration[5.1]
  def change
    add_reference :submissions, :user, foreign_key: true
  end
end
