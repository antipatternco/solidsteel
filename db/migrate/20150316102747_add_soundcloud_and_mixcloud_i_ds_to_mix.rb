class AddSoundcloudAndMixcloudIDsToMix < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.text :soundcloudId
      t.text :mixcloudId
    end
  end

  def self.down
    remove_column :mixes, :soundcloudId, :text
    remove_column :mixes, :mixcloudId, :text
  end
end