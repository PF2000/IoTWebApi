module Api::V1
  class ApiController < ApplicationController
    # Generic API stuff here
	
	before_action :authenticate , :except => [:login]
	before_action :autorize, :except => [:login] 
	before_action :checkLockOrCount, :except => [:login, :resetPassword, :show, :resetApiToken, :update,:isUserPassword] 



	def autorize
		#if the user is API
		if @current_user.nil?
			@current_user = User.find_by(id: 1);
		end 
		#get the role associated with the user
		@role = Role.find(@current_user.role.id);

		#implement permissions
		if @role.name == 'Manager'
			if params[:action] == 'destroy'
				render :status => :forbidden, :plain => 'Only admins can destroy'
			end
		elsif @role.name == 'User'
			if params[:action] == 'destroy'
				render :status => :forbidden, :plain => 'Only admins can destroy'
			elsif params[:action] == 'create'
				render :status => :forbidden, :plain => 'Only admins or managers can create'
			elsif params[:action] == 'update'
				render :status => :forbidden, :plain => 'Only admins or managers can update'
			end
		#to test
		#elsif @role.name == 'Admin'	
		#	if params[:action] == 'index'
		#		render :status => :forbidden, :json => 'Only admins or managers can index'
		#	end
		end
	end


  	def login
  		#Rails.logger.debug  params[:username]
  		#Rails.logger.debug  params[:password]
  		@user =	User.find_by(email: params[:username], password: params[:password])
		#Rails.logger.debug @user
  	   	if @user.nil?
  	   		render :status => :forbidden, :plain => "Authentication credentials provided were invalid"	     	
	    else
	    	if !@user.locked
	    		render json: @user
	    	else
	    		render :status => :forbidden, :plain => "User is locked"	     	
	    	end
	    end
 	end

 	def checkLockOrCount
 		if !@current_user.nil?
 			numDays = ((((Time.now - @current_user.token_count_reset_date)/60)/60)/24).to_i
	 		if (@current_user.locked && numDays < 30) && (@current_user.token_count >= @current_user.token_limit) 
	 			if !@current_user.locked
	 				@current_user.locked = true
	 			end
	 			render :status => :forbidden, :plain => "User is locked"
	 		else
	 			if numDays >= 30
	 				@current_user.token_count_reset_date = Time.now
	 				@current_user.token_count = 0
	 				@current_user.locked = false
	 			end
	 			@current_user.token_count = @current_user.token_count + 1 
	 			@current_user.save
	 		end
	 	end
 	end

  end
end