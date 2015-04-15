class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.integer :venue_id
      t.date :on_date
      t.text :text1
      t.text :text2
      t.text :interview
      t.integer :photo_status_id
      t.integer :text_status_id
      t.integer :status_id

      t.timestamps null: false
    end
  end
end
