class Event < ApplicationRecord
  has_many :ecomments
  include ImageUploader[:image]
end
