class ApiController < ApplicationController
	def store_location
		latitude = params[:latitude]
		longitude = params[:longitude]
		tracker_id = params[:tracker_id]	

		timezone_str= params[:timezone_str]
		timezone_id= params[:timezone_id]		

		created_at= DateTime.now
		puts created_at

		data={}

		if latitude.present? && longitude.present? && tracker_id.present? 
			logs=Log.create(latitude: latitude,longitude: longitude,tracker_id: tracker_id,created_at: created_at,timezone_str: timezone_str,timezone_id: timezone_id)
			puts "ghhhh"+logs.errors.inspect
			flash[:notice] = logs.errors.full_messages.to_sentence
			puts "sfdfdf"+logs.errors.full_messages.to_sentence
			if logs.errors.full_messages.to_sentence =="" #logs.blank?
				data['error'] = '0'
				data['msg'] = 'Entry suceessful'
			else

				data['error'] = '1002'
				data['msg'] = 'Entry unsuceessful'
				
	    	end
		else
				data['error'] = '1002'
				data['msg'] = 'Entry unsuceessful'
		end
		#logs.save
		
	respond_to do |format|
	      			format.json { render json: data }
	    			end
    end

    def get_details_of_user
		events=Log.where(tracker_id: params[:tracker_id])
		puts events
		data={}
		data['error'] = '0'
		data['msg'] = events
		respond_to do |format|
		      		format.json { render json: data }
		    	end
    end


    def get_user_list_of_company
    	company_uid = params[:company_uid]
	

		data={}
		if company_uid.present?
			

			company=User.where(company_id: company_uid)

			puts "Insput value::::::::::::"+company.inspect
			if not company.blank? #logs.blank?
				data['error'] = '0'
				data['msg'] = 'Sucessful'
				data['user_list']=company
			else

				data['error'] = '0'
				data['msg'] = 'Sucessful'
				data['user_list']=company

				
	    	end
		else
				data['error'] = '1002'
				data['msg'] = 'Unsucessful.No company exists.'
		end

		respond_to do |format|
	      			format.json { render json: data }
	    			end	
    end

    def add_company
    	time_interval = params[:time_interval]
		time_out = params[:time_out]	
		owner_name = params[:owner_name]
		name=params[:name]
		created_at= DateTime.now
		password_digest= params[:password]

		puts created_at

		data={}
		if time_interval.present? && time_out.present? && owner_name.present? && name.present?
			o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten

			company=Company.create(time_interval: time_interval,time_out: time_out,owner_name: owner_name,name: name,password_digest: password_digest) 
			company_uid=company.id.to_s+"_"	+(0..3).map { o[rand(o.length)] }.join.to_s
			company.company_uid=company_uid
			company.password_digest = BCrypt::Password.create(params[:password])

			puts "created::"+(company_uid).to_s

			company.save
			puts "created saved::"+company.company_uid

			if company.errors.full_messages.to_sentence =="" #logs.blank?
				data['error'] = '0'
				data['msg'] = 'Entry sucessful'

#				puts "created object::"+company.company_uid
				data['company_user_id']=company.company_uid
			else

				data['error'] = '1002'
				data['msg'] = 'Entry unsucessful'
				
	    	end
		else
				data['error'] = '1002'
				data['msg'] = 'Entry unsucessful.Something went wrong.'
		end

		respond_to do |format|
	      			format.json { render json: data }
	    			end

    end

    def add_user
    	name = params[:name]
		user_type = params[:user_type]	
		address = params[:address]
		phone=params[:phone]
		email_id=params[:email_id]
		dateofbirth=params[:dateofbirth]
		description= params[:description]
		track_id_reg=params[:track_id_reg]
		company_id	= params[:company_id]		
		created_at= DateTime.now
		puts created_at

		data={}
		
		if not User.check_for_duplicates(track_id_reg) || User.check_for_duplicates_for_phone_email(phone,email_id) 
			
			if name.present? && user_type.present? && address.present? && phone.present? && dateofbirth.present? && description.present? && track_id_reg.present? && company_id.present? && email_id.present? 
				user=User.create(name: name,user_type: user_type,address: address,created_at: created_at,phone: phone,dateofbirth: dateofbirth,description: description,track_id_reg: track_id_reg,company_id: company_id,email_id: email_id)
				puts "ghhhh"+user.errors.inspect
				flash[:notice] = user.errors.full_messages.to_sentence
				puts "sfdfdf"+user.errors.full_messages.to_sentence
				if user.errors.full_messages.to_sentence =="" 
					data['error'] = '0'
					data['msg'] = 'Entry suceessful'
				else

					data['error'] = '1002'
					data['msg'] = 'Entry unsuceessful'
					
		    	end
			else
					data['error'] = '1002'
					data['msg'] = 'Entry unsuceessful.Something went wrong.'
			end
		else
			data['error'] = '1003'
			data['phone_email']=User.check_for_duplicates_for_phone_email(phone,email_id)
			data['track_id_reg']=User.check_for_duplicates(track_id_reg)
			data['msg'] = 'Entry unsuceessful.Duplicate Entry or Something went wrong.'

		end
    	respond_to do |format|
	      			format.json { render json: data }
	    			end
    end

    def login_company
    	company_id = params[:company_id]
    	password= params[:password]

		
		data={}
    	if company_id.present? && password.present? 
    		company = Company.find_by_company_uid(params[:company_id])
    		if company && company.authenticate(params[:password])
    			data['error'] = '0'
				data['msg'] = 'suceessful login.'	

    		else
				data['error'] = '1002'
				data['msg'] = 'unsuceessful.Something went wrong.'	
    		end

    	else
			data['error'] = '1003'
			data['msg'] = 'Something went wrong.Invalid Data'	
    	end
    	respond_to do |format|
	      			format.json { render json: data }
	    			end	
    end

    
     
end
