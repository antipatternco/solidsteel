class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.text     :session_name
      t.datetime :broadcast_date
      t.text     :notes
      t.text     :altnotes
      t.text     :link1
      t.text     :link2
      t.text     :link3
      t.text     :link4
      t.timestamps null: false
    end
  end
end
