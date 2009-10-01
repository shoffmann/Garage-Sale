class DropImages < ActiveRecord::Migration
  def self.up
    drop_table :images
  end

  def self.down
    create_table :images do |t|
      t.string :name
      t.binary :image_pic
      t.timestamps
    end
  end
end
