require "test_helper"

class ConversationsControllerTest < ActionDispatch::IntegrationTest

  test "should get index" do
token = JWT.encode({ user_id: users(:one).id })

get "/api/conversations", headers: { 'Authorization' => 'Bearer ' + token }

    assert_response :success
  end
end
