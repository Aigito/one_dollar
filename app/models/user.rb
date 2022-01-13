class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar

  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :investment
  validates_uniqueness_of :email
end
