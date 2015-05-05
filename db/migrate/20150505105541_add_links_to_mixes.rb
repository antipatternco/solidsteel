class AddLinksToMixes < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.string :permalink
      t.string :downloadlink
    end
  end

  def self.down
    remove_column :mixes, :permalink, :string
    remove_column :mixes, :downloadlink, :string
  end
end
