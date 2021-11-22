class Review < ApplicationRecord
    has_many :unicorns, through: :superpowers
    belongs_to :superpower
end
