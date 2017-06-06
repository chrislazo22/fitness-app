class User < ApplicationRecord
  has_many :workout_plans

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email

  def full_name
    last_name.upcase + ", " + first_name.upcase
  end
end
