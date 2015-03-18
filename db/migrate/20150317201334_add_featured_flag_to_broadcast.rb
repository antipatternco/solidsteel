class AddFeaturedFlagToBroadcast < ActiveRecord::Migration
  def change
    add_column :broadcasts, :featured, :boolean
  end
end
