class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
		t.column :name, :string, :limit => 32, :null => false
		t.column :emp_count,:integer,:null => false
		t.column :created_at, :timestamp

    end
  end

   def self.down
      drop_table :companies
   end
end
