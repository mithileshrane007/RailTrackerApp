class Logs3 < ActiveRecord::Migration
  def change
  	  	rename_column :logs, :emp_id, :tracker_id

  end
end
