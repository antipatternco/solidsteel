class AddBroadcastRefToMixes < ActiveRecord::Migration
  def change
    add_reference :mixes, :broadcast, index: true
    add_foreign_key :mixes, :broadcasts
  end
end
