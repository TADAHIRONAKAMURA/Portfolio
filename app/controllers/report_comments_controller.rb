class ReportCommentsController < ApplicationController
		def create
		@f_report = FishingReport.find(params[:fishing_report_id])
		@comment = current_user.report_comment.new(report_comment_params)
		@comment.fishing_report_id = @f_report.id
		if @comment.save
			redirect_to fishing_report_path(@f_report)
		else
			flash.now[:notice] = "100文字以内で投稿してください"
			render :template => 'fishing_reports/show'
		end

	end


		def destroy
		@comment = Report_comment.find_by(fishing_report_id: params[:fishing_report_id], id: params[:id])
		@review.destroy
		redirect_to fishing_report_path(params[:fishing_report_id])
	end

	private
	def report_comment_params
  		params.require(:report_comment).permit(:user_id, :fishing_report_id, :comment)
	end
end


# if @review.save
# 			redirect_to item_path(@item)
# 		else
# 			@items = Item.all
# 			# 別のコントローラーアクションにrenderする場合アクションに記入されているの変数を持ってこないといけない
# 			@review = Review.new
# 			@artists = Artist.all
# 			@genres = Genre.all
# 			@labels = Label.all
# 			@disks = Disk.all
# 			@songs = Song.all
# 			@cart_item =CartItem.new
# 			@likes = Like.all
# 			@rank = Item.find(Like.group(:item_id).order('count(item_id) desc').limit(10).pluck(:item_id))			
# 			flash.now[:notice] = "100文字以内で投稿してください"
# 			render :template => 'items/show'
# 		end