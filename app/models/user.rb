class User < ApplicationRecord
  has_many :workout_plans

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :phone_number

  PHONE_REGEX = /\A[0-9]*\Z/

  validates_format_of :phone_number, with: PHONE_REGEX
  validates :phone_number, presence: true, length: { is: 10 }
  validates :phone_number, numericality: { message: 'Enter Phone Number Without Spaces (Numbers Only)'}
  def full_name
    first_name.capitalize + " " + last_name.capitalize
  end
end
