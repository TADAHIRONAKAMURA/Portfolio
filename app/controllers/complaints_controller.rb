class ComplaintsController < ApplicationController

	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
		@complaint = current_user.complaints.new(complaint_params)
		@complaint.fishing_report_id = @f_report.id
		if @complaint.save
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
		@complaint = Complaint.find_by(fishing_report_id: params[:fishing_report_id], id: params[:id])
		@complaint.destroy
		redirect_to fishing_report_path(params[:fishing_report_id])
	end

	private

	def complaint_params
  	params.require(:complaint).permit(:user_id, :fishing_report_id, :c_comment)
	end

end
