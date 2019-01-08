class Recip < ApplicationRecord
    has_and_belongs_to_many :ingredients
    has_and_belongs_to_many :comments
    belongs_to :user
end
