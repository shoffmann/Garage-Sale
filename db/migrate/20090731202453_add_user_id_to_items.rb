class AddUserIdToItems < ActiveRecord::Migration
  def self.up
    add_column :items, :user_id, :int
  end

  def self.down
    remove_column :items, :user_id
  end
end
