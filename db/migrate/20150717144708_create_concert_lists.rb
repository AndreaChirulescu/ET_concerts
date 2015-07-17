class CreateConcertLists < ActiveRecord::Migration
  def change
    create_table :concert_lists do |t|
      t.integer :concert_id
      t.integer :band_id

      t.timestamps null: false

      t.belongs_to :concert, index: true
      t.belongs_to :band, index: true
    end
  end
end
