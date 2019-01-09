class Recip < ApplicationRecord
    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default: "/assets/images/not-available.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

    has_and_belongs_to_many :ingredients
    has_and_belongs_to_many :comments
    belongs_to :user
end
