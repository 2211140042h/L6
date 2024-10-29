require "test_helper"

class CartitemTest < ActiveSupport::TestCase
  test '正常ケース' do
    product = Product.create!(name: "Test Product", price: 1000)
    cart = Cart.create!

    cartitem = Cartitem.new(product_id: product.id, cart_id: cart.id, qty: 1)
    assert cartitem.valid? 
  end
  
  test '異常ケース1' do
    cartitem = Cartitem.new
    assert cartitem.invalid?
    cartitem.product_id = 
    assert_not cartitem.valid?
    assert cartitem.errors.include?(:product_id)
  end
  
  test '異常ケース2' do
    cartitem = Cartitem.new
    assert cartitem.invalid?
    cartitem.cart_id = 
    assert_not cartitem.valid?
    assert cartitem.errors.include?(:cart_id)
  end
  
  test '異常ケース3' do
    cartitem = Cartitem.new
    assert cartitem.invalid?
    cartitem.qty = 
    assert_not cartitem.valid?
    assert cartitem.errors.include?(:qty)
  end
  
  test '異常ケース4' do
    cartitem = Cartitem.new
    assert cartitem.invalid?
    cartitem.qty = 'ああ'
    assert_not cartitem.valid?
    assert cartitem.errors.include?(:qty)
  end
  
  test '異常ケース5' do
    cartitem = Cartitem.new
    assert cartitem.invalid?
    cartitem.qty = 0
    assert_not cartitem.valid?
    assert cartitem.errors.include?(:qty)
  end
end
