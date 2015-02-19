class CreateBroadcasts < ActiveRecord::Migration
  def change
    create_table :broadcasts do |t|
      t.text     :session_name
      t.datetime :broadcast_date
      t.timestamps null: false
    end
  end
end
