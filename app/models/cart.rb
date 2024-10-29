class Cart < ApplicationRecord
  has_many :prodducts
  has_many :cartitems
  has_many :cartitem_products, source: :product, through: :cartitems
end
