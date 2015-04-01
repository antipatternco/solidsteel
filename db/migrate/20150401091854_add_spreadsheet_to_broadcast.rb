class AddSpreadsheetToBroadcast < ActiveRecord::Migration
  def self.up
    change_table :broadcasts do |t|
      t.attachment :spreadsheet
    end
  end

  def self.down
    remove_attachment :broadcasts, :spreadsheet
  end
end
