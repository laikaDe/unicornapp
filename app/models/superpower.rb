class Superpower < ApplicationRecord
    validates :type, :description, presence: true
    belongs_to :unicorn
    self.inheritance_column = :_type_disabled
end
