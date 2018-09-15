class ComplaintsController < ApplicationController
	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
		@complaint = current_user.complaint.new(complaint_params)
		@complaint.fishing_report_id = @f_report.id
		@complaint.save
		redirect_to fishing_report_path(@f_report)
	end

		# def destroy
	# 	@review = Review.find_by(fishing_report_id: params[:fishing_report_id], id: params[:id])
	# 	@review.destroy
	# 	redirect_to fishing_report_path(params[:fishing_report_id])
	# end

	private
	def complaint_params
  	params.require(:complaint).permit(:user_id, :fishing_report_id, :c_comment)
	end

end
