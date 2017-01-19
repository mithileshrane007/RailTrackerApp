class ChangeDbStruct1 < ActiveRecord::Migration
  def change
  	 add_column :users, :address,:string,:null => false
	 add_column :users, :dateofbirth, :string,:null => false

	 add_column :users, :phone,:string,:null => false
  end
end
