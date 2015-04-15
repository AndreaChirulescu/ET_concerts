class CreateConcertBands < ActiveRecord::Migration
  def change
    create_table :concert_bands do |t|
      t.integer :concert_id
      t.integer :band_id

      t.timestamps null: false
    end
  end
end
