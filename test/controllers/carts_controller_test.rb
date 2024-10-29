require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end
  
  test 'showテンプレートをrenderすること' do
    get cart_url(@cart)
    assert_response :success
  end
end
