require "test_helper"

class ContactTest < ActionDispatch::IntegrationTest
  test "see what looks like" do
    get "/api/v1/contacts"
    assert_response :success

    post "/api/v1/contacts"
      params: {"contact": { "name": 'João', "relation": 'personal', "user": user}}
  end
end
