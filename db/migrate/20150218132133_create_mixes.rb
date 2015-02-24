class CreateMixes < ActiveRecord::Migration
  def change
    create_table :mixes do |t|
      t.text :name
      t.integer :part
      t.timestamps null: false
    end
  end
end
