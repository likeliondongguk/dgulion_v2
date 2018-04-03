class Submission < ApplicationRecord
  belongs_to :assignment
  belongs_to :user
  has_many :scomments
  # has_many
  include ImageUploader[:image]
  before_save :set_title
  
  def set_title
    self.title = self.assignment.title.to_s+"_"+self.user.name.to_s
  end
end
