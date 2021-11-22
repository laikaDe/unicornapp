class Unicorn < ApplicationRecord
    validates :name, :age, :color, :personality, :quirks, presence: true
    has_many :superpowers
    has_many :reviews, through: :superpowers
    belongs_to :user
end
