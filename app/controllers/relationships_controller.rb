class RelationshipsController < ApplicationController
  before_action :location, except: [:follow]

	def follow
  		user = User.find(params[:id])
  		if current_user.following?(user)
  		current_user.unfollow!(user)
  		else
  		current_user.follow!(user)
  		end
      str = session[:return_to]
      if str.count('/') == 3
        render partial:'user', locals: {user: user}
  		# 部分テンプレートを渡す
    	render partial: 'users/user', locals: {user: user}
      else
      # フォロワーのカウントを渡す
        render json: user.followers.count
      end
  	end

  	def count
  		# jsに文字列だけ渡す
    	render json: current_user.followed_users.count
    	# redirect_to users_path
  	end

  	def tmp
    	if params[:which] == "follow"
      	user = User.find(params[:whose])
      	render partial: 'users/follow', locals: {forf: user.followed_users, a: user.nickname, b: params[:which]}
    	else
      	user = User.find(params[:whose])
      	render partial: 'users/follow', locals: {forf: user.followers, a: user.nickname, b: params[:which]}
      end
   end
end


