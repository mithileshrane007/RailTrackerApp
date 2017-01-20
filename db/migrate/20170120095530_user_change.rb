class UserChange < ActiveRecord::Migration
  def change

  	 remove_column :users, :user_type
	 add_column :users, :user_type, "enum('admin','manager','employee')", :default => 'employee'


  end
end


