class User < ActiveRecord::Base
	enum user_type: [ :admin, :manager, :employee ]
	belongs_to :company
	has_many :log
	has_many :assigned_to_from
	validates_presence_of :name

	#before_save :check_for_duplicates?
	
	def self.check_for_duplicates(track_id_reg)
	#  	if User.find(:all, :conditions => ["track_id_reg = ?", self.track_id_reg])
	 # 	 	raise 'some check_for_duplicates'
  	# user=User.find_by track_id_reg: self.track_id_reg
  	# 	#end
  	# 	if user
  	# 		return "duplicate"
  	# 	else		

  	# 	end
  	 	user=User.exists?(track_id_reg: track_id_reg)
  	 	return user
	end

	def self.check_for_duplicates_for_phone_email(phone,email_id)
		userphone=User.exists?(	phone: 	phone)
  	 	useremail=User.exists?(	email_id: email_id)
  	 	return userphone && useremail
		
	end



end
