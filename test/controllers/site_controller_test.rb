require 'test_helper'

class SiteControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get login" do
    get :login
    assert_response :success
  end
  
  test "should login" do
    
    #TODO: first check they we not logged in
    assert session[:current_user_id] == nil
    
    post :login_post, {:username => "test", :password => "password"}
    
    assert session[:current_user_id] != nil
    assert_redirected_to("/")
    
  end
  
  
  test "should not login" do
    
    #TODO: first check they we not logged in
    assert session[:current_user_id] == nil
    
    post :login_post, {:username => "test", :password => "invalid password"}
    
    assert session[:current_user_id] == nil
    assert_redirected_to("/login")
    
  end
  
  
  test "should log out" do
    assert session[:current_user_id] == nil, "Should not be a user logged in"
    post :login_post, {:username => "test", :password => "password"}
    assert session[:current_user_id] != nil, "User should have been logged in"
    
    get :logout
    assert session[:current_user_id] == nil, "User was not logged out"
    
  end

end
