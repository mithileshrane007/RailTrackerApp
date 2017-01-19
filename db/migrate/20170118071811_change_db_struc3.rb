class ChangeDbStruc3 < ActiveRecord::Migration
  def change
  	  add_column :companies, :company_uid, :string,:null => false

  end
end
