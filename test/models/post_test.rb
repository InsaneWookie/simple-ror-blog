require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test "should not save post without title" do
    post = Post.new
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
