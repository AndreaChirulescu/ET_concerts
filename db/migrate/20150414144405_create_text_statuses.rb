class CreateTextStatuses < ActiveRecord::Migration
  def change
    create_table :text_statuses do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
