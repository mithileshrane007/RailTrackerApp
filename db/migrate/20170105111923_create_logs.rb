class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
	      t.column :latitude, :double,:null => false
	      t.column :longitude, :double ,:null => false
	      t.column :user_id, :integer,:null => false
		    t.column :created_at, :timestamp,:null => false
        t.column :timezone, :timezone,:null => false

    end
  end

  def self.down
      drop_table :logs
   end
end
