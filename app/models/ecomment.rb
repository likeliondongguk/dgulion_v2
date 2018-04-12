class Ecomment < ApplicationRecord
  belongs_to :event


  def self.public_comments
    self.where(secret: [nil,false])
  end

  def self.secret_comments
    self.where(secret: true)
  end
end
