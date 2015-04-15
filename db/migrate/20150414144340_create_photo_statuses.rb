class CreatePhotoStatuses < ActiveRecord::Migration
  def change
    create_table :photo_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
