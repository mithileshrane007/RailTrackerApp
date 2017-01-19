class ChangeCompany < ActiveRecord::Migration
  def change
  	remove_column :companies, :password
  end
end
