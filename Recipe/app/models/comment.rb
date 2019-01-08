class Comment < ApplicationRecord
    has_and_belongs_to_many :recips
    belongs_to :user
end
