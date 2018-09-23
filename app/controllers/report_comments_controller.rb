class ReportCommentsController < ApplicationController
	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
		@comment = current_user.report_comments.new(report_comment_params)
		@comment.fishing_report_id = @f_report.id
		if @comment.save
			redirect_to fishing_report_path(@f_report)
		else
			@f_report = FishingReport.find(params[:fishing_report_id])
			@f_reports = FishingReport.all
			@spots = FishingSpot.all
			@lure_types = LureType.all
			@comment = ReportComment.new 
			@complaint = Complaint.new
			flash.now[:alert] = "1文字から100文字以内で投稿してください"
			render 'fishing_reports/show'
		end
	end

	def destroy
		@comment = ReportComment.find_by(fishing_report_id: params[:fishing_report_id], id: params[:id])
		# 上記のコードと同じ意味
		# @fishing_report = FishingReport.find(params[:fishing_report_id])
		# @comment = @fishing_report.report_comments.find_by(id: params[:id])
		@comment.destroy
		redirect_to fishing_report_path(params[:fishing_report_id])
	end

	private
	def report_comment_params
  		params.require(:report_comment).permit(:user_id, :fishing_report_id, :comment)
	end
end
