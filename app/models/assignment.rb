class Assignment < ApplicationRecord
  has_many :submissions, dependent: :destroy
end
