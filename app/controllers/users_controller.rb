class UsersController < ApplicationController
	def index
		@users = User.all
		@user = current_user
	end

	def user_index
		@users = User.all
	end

	def new
	end

	def show
		@user = User.find(params[:id])
		# @f_reports = FishingReport.all
		# @spots = FishingSpot.all
		# @lure_types = LureType.all
	end

	def mypage
		@user = User.find(current_user.id)
	end

	def contract
		# 利用規約
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if admin_signed_in?
			@user.update(user_params)
		elsif user_signed_in?
			if @user.id == current_user.id
		   		@user.update(user_params)
		   	    redirect_to mypage_path
		    else
		   	    redirect_to fishing_spots_path
		    end  	
	     else
	      	redirect_to fishing_spots_path 
	   	end
  	end

   def destroy
		user = User.find(params[:id])
    	if admin_signed_in?
      	user.destroy
      	redirect_to users_path
    	else
      		if user_signed_in?
        		user.destroy
        		redirect_to root_path
      		else
        		redirect_to new_user_session_path
      		end
    	end
	end
	
	def user_params
		params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :phone_number, :artist_id, :introduction, :user_image)
	end
end

