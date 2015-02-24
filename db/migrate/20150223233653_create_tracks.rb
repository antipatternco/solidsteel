class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.text :artist
      t.text :title
      t.text :composed
      t.text :published
      t.text :record_label
      t.text :catalogue_no
      t.text :duration
      t.text :notes
      t.timestamps null: false
    end

    add_reference :tracks, :mix, index: true
    add_foreign_key :tracks, :mixes
  end
end
