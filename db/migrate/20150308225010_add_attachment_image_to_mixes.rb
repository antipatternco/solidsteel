class AddAttachmentImageToMixes < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.attachment :background_image
      t.attachment :mix_image
    end
  end

  def self.down
    remove_attachment :mixes, :background_image
    remove_attachment :mixes, :mix_image
  end
end
