class AddStatusesColor < ActiveRecord::Migration
  def change
  	add_column :statuses, :color, :string, nullable:false, default: "#fff"
  end
end
