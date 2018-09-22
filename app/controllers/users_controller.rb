class UsersController < ApplicationController
	def index
		if user_signed_in? || admin_signed_in?
			@users = User.all
			@user = current_user
		else
			redirect_to root_path
			# redirect_to new_user_session_path
		end
	end

	def user_index
		if admin_signed_in?
			@users = User.all
		else
			redirect_to root_path
		end
	end

	def user_show
		if admin_signed_in?
		@users = User.all
		else
			redirect_to root_path
		end
	end

	def new
	end

	def show
		if user_signed_in? || admin_signed_in?
			@user = User.find(params[:id])
			# @user = current_user
			@users = User.all
		else
			redirect_to root_path
			flash[:notice]="ログインもしくはサインアップをしてから閲覧してください。" 
		end
	end

	def mypage
		if user_signed_in? || admin_signed_in?
			@user = User.find(current_user.id)
			@users = User.all
		else
			redirect_to root_path
		end
	end

	def contract
	end

	def edit
		if admin_signed_in?
			@user = User.find(params[:id])
		elsif user_signed_in?
			@user = User.find(params[:id])	
			@user == current_user
		else
			redirect_to root_path
		end
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
   		if user_signed_in? || admin_signed_in?
   			user = User.find(params[:id])
   			user.destroy
      		redirect_to users_path
      	else
        	redirect_to new_user_session_path
      	end

		# user = User.find(params[:id])
  #   	if admin_signed_in?
  #     	user.destroy
  #     	redirect_to users_path
  #   	else
  #     		if user_signed_in?
  #       		user.destroy
  #       		redirect_to root_path
  #     		else
  #       		redirect_to new_user_session_path
  #     		end
    	# end
	end
	
	def user_params
		params.require(:user).permit(:email, :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :phone_number, :artist_id, :introduction, :user_image)
	end
end

