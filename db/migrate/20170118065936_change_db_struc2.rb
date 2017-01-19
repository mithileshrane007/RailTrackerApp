class ChangeDbStruc2 < ActiveRecord::Migration
  def change
  	  	add_column :companies, :password, :string,:null => false

  end
end
