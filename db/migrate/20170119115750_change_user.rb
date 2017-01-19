class ChangeUser < ActiveRecord::Migration
  def change
  	add_column :users, :email_id, :string,:null => false

  end
end
