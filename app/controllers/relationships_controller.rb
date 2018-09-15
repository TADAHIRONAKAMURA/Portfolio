class RelationshipsController < ApplicationController
	def follow
  		user = User.find(params[:id])
  		if current_user.following?(user)
  		current_user.unfollow!(user)
  		else
  		current_user.follow!(user)
  		end
  		# 部分テンプレートを渡す
    	render partial: 'users/user', locals: {user: user}
    	# redirect_to users_path
  	end

  	def count
  		# jsに文字列だけ渡す
    	render json: current_user.followed_users.count
    	# redirect_to users_path
  	end

  	def tmp
    	if params[:dotti] == "follow"
      	user = User.find(params[:dareno])
      	render partial: 'users/follow', locals: {forf: user.followed_users, a: user.nickname, b: params[:dotti]}
    	else
      	user = User.find(params[:dareno])
      	render partial: 'users/follow', locals: {forf: user.followers, a: user.nickname, b: params[:dotti]}
      end
   end
end


