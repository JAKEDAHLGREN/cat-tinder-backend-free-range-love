class Cow < ApplicationRecord
    validates :name, :age, :enjoys, :color, :species, :image, presence: true
    validates :enjoys, length: { minimum: 10}
end
