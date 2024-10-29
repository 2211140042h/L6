class Product < ApplicationRecord
  has_many :cartitems
  has_many :carts, source: :cart, through: :cartitems

  validates :name, :price, presence: true
  validates :price, numericality: { only_integer: true }
  validates :price, numericality: { greater_than_or_equal_to: 0 }
end
