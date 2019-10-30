class Category < ApplicationRecord
    has_many :items_category
    has_many :items, through: :items_category
    validates :name, uniqueness: true
end
