class AddBackgroundImageToBroadcast < ActiveRecord::Migration
  def self.up
    change_table :broadcasts do |t|
      t.attachment :background_image
    end
  end

  def self.down
    remove_attachment :broadcasts, :background_image
  end
end