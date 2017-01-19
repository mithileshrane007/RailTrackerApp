class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
		t.column :name, :string, :limit => 32, :null => false
		t.column :company_name, :string,:null => false
		t.column :user_type, :string, default: 0
		t.column :description, :text
		t.column :created_at, :timestamp
		t.column :company_id, :integer

    end
  end
   def self.down
      drop_table :users
   end
end
