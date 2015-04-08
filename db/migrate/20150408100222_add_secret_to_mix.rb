class AddSecretToMix < ActiveRecord::Migration
  def self.up
    change_table :mixes do |t|
      t.string :secret
    end
  end

  def self.down
    remove_column :mixes, :secret, :string
  end
end