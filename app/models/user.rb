class User < ApplicationRecord

  has_many :unicorns
  has_many :google_accounts
  has_many :superpowers, through: :unicorns
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
