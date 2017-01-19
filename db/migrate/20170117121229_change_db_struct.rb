class ChangeDbStruct < ActiveRecord::Migration
  def change
  	 add_column :companies, :time_interval, :string,:null => false
     add_column :companies, :time_out ,:string,:null => false
     add_column :companies, :owner_name, :string,:null => false
     remove_column :companies, :emp_count
     remove_column :users, :company_name
     remove_column :assigned_to_froms, :latitude

	


  end
end
