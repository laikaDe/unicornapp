class Unicorn < ApplicationRecord
    has_many :superpowers
    belongs_to :user
end
