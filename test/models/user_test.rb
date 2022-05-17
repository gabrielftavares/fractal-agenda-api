require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "User should contain name, email and password" do
    user = User.new(name: 'Homelander', email: 'homelander@gmail.com', password: 'FpyVp127')
    assert user.save
  end

  test "Can't create without name" do
    user = User.new(email: 'johnsenna@gmail.com', password: 'oNeYgP72')
    assert_not user.save
  end
end
