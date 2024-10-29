class Cartitem < ApplicationRecord
  belongs_to :product
  
  validates :product_id, :cart_id, :qty, presence: true
  validates :qty, numericality: {
      only_integer: true, 
      greater_than_or_equal_to: 1 }
end
