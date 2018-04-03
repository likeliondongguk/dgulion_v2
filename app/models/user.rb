class User < ApplicationRecord
  rolify
  include ImageUploader[:image]
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  after_update :assign_default_role
  scope :admin, -> {with_role :admin}
  scope :default, -> {with_role :default}
  def assign_default_role
    self.add_role(:default) if self.roles.blank?
  end
  has_many :submissions
end
