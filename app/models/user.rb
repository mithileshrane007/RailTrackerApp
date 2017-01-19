class User < ActiveRecord::Base
	enum user_type: [ :admin, :manager, :employee ]
	belongs_to :company
	has_many :log
	has_many :assigned_to_from
	validates_presence_of :name

	before_save :check_for_duplicates?
		def check_for_duplicates?
		  	if User.find(:all, :conditions => ["track_id_reg = ?", self.track_id_reg])
		  	 	raise 'some check_for_duplicates'
	  		end
		end
	
end
