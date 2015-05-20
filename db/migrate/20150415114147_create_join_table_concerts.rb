class CreateJoinTableConcerts < ActiveRecord::Migration
  def change
    create_join_table :concerts, :bands do |t|
      t.integer :venue_id
      t.integer :concert_id
      t.index [:concert_id, :band_id]
      t.index [:band_id, :concert_id]
    end
  end
end
