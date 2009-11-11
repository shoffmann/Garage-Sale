class AddItemIndex < ActiveRecord::Migration
  def self.up
    add_index :items, :title
  end

  def self.down
    remove_index :items, :title
  end
end
