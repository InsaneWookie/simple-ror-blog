require 'test_helper'

class PostTest < ActiveSupport::TestCase
  
  setup do
    @user = users(:one)
  end
  
  test "should not save post without title" do    
    post = Post.new
    post.user_id = @user.id
    assert !post.save
  end
  
  
  test "should delete comments with post" do
    post = posts(:one)
    #post = Post.find(1)
    assert post.comments.count > 0, "no comments found"
    
    post.destroy
    
    assert post.comments.count == 0, "comments still exist"
  end
end
