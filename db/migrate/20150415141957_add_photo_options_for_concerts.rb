class AddPhotoOptionsForConcerts < ActiveRecord::Migration
  def change
  	remove_column :concerts, :photo_status_id
  	add_column :concerts, :photo1, :integer
  	add_column :concerts, :photo2, :integer
  	add_column :concerts, :user_id, :integer
  end
end
