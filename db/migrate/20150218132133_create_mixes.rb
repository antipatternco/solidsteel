class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.text :name
      t.text :url
      t.datetime :broadcast_date
      t.timestamps null: false
    end
  end
end
