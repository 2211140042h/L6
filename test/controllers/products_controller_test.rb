require "test_helper"

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end
  
  test 'newテンプレートをrenderすること' do
    get new_product_url
    assert_response :success
  end
  
  test 'productをcreateすること' do
    assert_difference('Product.count') do
      post products_url, params: {product: {name: "test", price: 100}}
    end
    assert_redirected_to products_path
  end
  
  test "productを削除すること" do
    assert_difference('Product.count', -1) do 
      delete product_url(@product)
    end
    assert_redirected_to products_path
  end
end
