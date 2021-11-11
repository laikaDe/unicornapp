class Superpower < ApplicationRecord
    belongs_to :unicorn
    self.inheritance_column = :_type_disabled
end
