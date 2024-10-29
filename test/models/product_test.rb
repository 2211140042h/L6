require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test '正常ケース' do
    product = Product.new
    product.name = 'ノート'
    product.price = 1000
    assert product.valid?
  end
  
  test '異常ケース1' do
    product = Product.new
    assert product.invalid?
    product.name = ''
    assert_not product.valid?
    assert product.errors.include?(:name)
  end
  
  test '異常ケース2' do
    product = Product.new
    assert product.invalid?
    product.price = 'ノート'
    assert_not product.valid?
    assert product.errors.include?(:price)
  end
  
  test '異常ケース3' do
    product = Product.new
    assert product.invalid?
    product.price = 
    assert_not product.valid?
    assert product.errors.include?(:price)
  end
  
  test '異常ケース4' do
    product = Product.new
    assert product.invalid?
    product.price = -100
    assert_not product.valid?
    assert product.errors.include?(:price)
  end
end
