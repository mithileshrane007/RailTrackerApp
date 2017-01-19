class CreateAssignedToFroms < ActiveRecord::Migration
  def change
    create_table :assigned_to_froms do |t|
t.column :latitude, :double,:null => false
	  t.column :assigned_by, :integer ,:null => false
	  t.column :assigned_person, :integer,:null => false
	  t.column :created_at, :timestamp

    end
  end
end
