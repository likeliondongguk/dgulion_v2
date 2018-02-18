class Course < ApplicationRecord
  acts_as_paranoid
  belongs_to :curri
  belongs_to :user
end
