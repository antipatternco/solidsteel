class AddHighlightToBroadcast < ActiveRecord::Migration
  def change
    add_column :broadcasts, :highlight, :boolean
  end
end
