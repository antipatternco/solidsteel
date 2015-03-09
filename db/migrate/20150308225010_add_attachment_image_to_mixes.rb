class AddAttachmentImageToMixes < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :mixes, :image
  end
end
