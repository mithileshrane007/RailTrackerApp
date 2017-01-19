class ChangeDbStruc < ActiveRecord::Migration
  def change
  	add_column :users, :track_id_reg, :string,:null => false
  end
end
