class Superpower < ApplicationRecord
    validates :type, :description, presence: true
    belongs_to :unicorn
    has_many :reviews
    self.inheritance_column = :_type_disabled
end
