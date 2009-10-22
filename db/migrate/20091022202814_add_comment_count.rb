class AddCommentCount < ActiveRecord::Migration
  def self.up
    add_column :items, :comments_count, :int
  end

  def self.down
    remove_column :items, :comment_count
  end
end
