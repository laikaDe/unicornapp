class User < ApplicationRecord
  
  # has_secure_password # validation presence of password
  has_many :unicorns
  has_many :google_accounts
  has_many :superpowers, through: :unicorns
  has_many :reviews, through: :superpowers
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
