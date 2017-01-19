class Logs2 < ActiveRecord::Migration
  def change
  	 rename_column :logs, :user_id, :emp_id
	
     add_column :logs, :timezone_str, :string,:null => false
     add_column :logs, :timezone_id ,:string,:null => false
  end
end
