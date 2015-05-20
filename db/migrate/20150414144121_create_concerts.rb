class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :venue_id
      t.date :on_date
      t.integer :text1
      t.integer :text2
      t.integer :interview
      t.integer :photo_status_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
