require 'test_helper'

class PostsControllerTest < ActionController::TestCase
  
  
  
  setup do
    @user = users(:one)
  end
  
  
  test "should create post" do
    skip "to be implemented"
    #create user (created in fixture)
    
    #create post with user
    
    
    assert_difference('Post.count') do
      post :create, post: { user_id: 1, title: "title123", text: "some text" }
    end

    assert_redirected_to user_path(assigns(:user))
  end
end
