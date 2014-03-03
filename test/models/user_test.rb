require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "create user" do
    
    user = User.new
    
    user.username = "test"
    user.password = "password"
    user.password_confirmation = "password"
    
    assert user.save!, "could not save user"
    
  end
end
