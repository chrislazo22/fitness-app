class User < ApplicationRecord
  has_many :workout_plans

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :phone_number
  validates :phone_number, presence: true, length: { minimum: 10 }
  validates :phone_number, numericality: { message: 'Enter Phone Number Without Spaces (Numbers Only)'}
  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end
