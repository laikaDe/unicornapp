class Unicorn < ApplicationRecord
    validates :name, :age, :color, :personality, :quirks, presence: true
    has_many :superpowers
    # belongs_to :user
end
