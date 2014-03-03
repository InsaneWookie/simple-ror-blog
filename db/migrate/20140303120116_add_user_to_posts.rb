class AddUserToPosts < ActiveRecord::Migration
  
  def up
    execute "ALTER TABLE posts ADD CONSTRAINT fk_post_users FOREIGN KEY (user_id) REFERENCES users(id)"
  end

  def down
    execute "ALTER TABLE posts DROP CONSTRAINT fk_post_users"
  end
  
end
