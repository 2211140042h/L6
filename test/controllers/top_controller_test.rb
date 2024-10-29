require "test_helper"

class TopControllerTest < ActionDispatch::IntegrationTest
  test 'mainテンプレートをrenderすること' do
    get root_path
    assert_redirected_to products_path
  end
end
