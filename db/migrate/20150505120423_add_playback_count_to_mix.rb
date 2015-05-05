class AddPlaybackCountToMix < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.integer :playbackcount
    end
  end

  def self.down
    remove_column :mixes, :playbackcount, :integer
  end
end
