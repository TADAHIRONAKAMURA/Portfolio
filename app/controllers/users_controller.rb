class UsersController < ApplicationController
	before_action :user_admin, except: :contract

	def index
			@users = User.all
			@user = current_user
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
			# @user = User.find(params[:id])
			@users = User.all
		else
			redirect_to root_path
		end
	end

	def new
	end

	def show
			@user = User.find(params[:id])
			@users = User.all
	end

	def mypage
			@user = User.find(current_user.id)
			@users = User.all
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
		   	    flash[:notice]="基本情報の編集が完了しました！"
		    else
		   	    redirect_to fishing_spots_path

		    end  	
	     else
	      	redirect_to fishing_spots_path 
	   	end
  	end

   	def destroy
   			user = User.find(params[:id])
   			user.destroy
      		redirect_to users_path
      	

	end
	
	def user_params
		params.require(:user).permit(:email, :password_confirmation, :last_name, :first_name, :last_name_kana, :first_name_kana, :nickname, :phone_number, :introduction, :user_image)
	end

	def user_admin
		if user_signed_in? || admin_signed_in?
		else
			redirect_to root_path
			flash[:notice]="ログインもしくはサインアップしてから閲覧してください。！"
		end	
	end

end

