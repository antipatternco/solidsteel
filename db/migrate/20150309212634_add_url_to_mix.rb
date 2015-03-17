class AddUrlToMix < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.string :url
    end
  end

  def self.down
    remove_column :mixes, :url, :string
  end
end
