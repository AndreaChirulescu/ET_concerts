class CreateJoinTableVenues < ActiveRecord::Migration
  def change
    create_join_table :venues, :concerts do |t|
      t.integer :venue_id
      t.integer :concert_id
      t.index [:venue_id, :concert_id]
      t.index [:concert_id, :venue_id]
    end
  end
end
