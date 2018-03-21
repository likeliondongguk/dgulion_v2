class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  include ImageUploader[:image]
end
