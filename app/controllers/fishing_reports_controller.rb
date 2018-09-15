class FishingReportsController < ApplicationController
	def index
		@f_reports = FishingReport.all
		@spots = FishingSpot.all
		@lure_types = LureType.all

	end

	def report_index
		@f_reports = FishingReport.all
	end

	def new
		@f_report = FishingReport.new
		@luretype = LureType.all
	end

	def create
		@f_report = FishingReport.new(fishing_report_params)
		@f_report.user_id = current_user.id
		@f_report.save
		# puts @f_report.errors.full_messages
		redirect_to fishing_reports_path(@f_report.id)
		flash[:notice]="釣果報告が完了しました！"
		

		# if @f_report.save
		# 	redirect_to fishing_reports_path(@f_report.id)
		# 	flash[:notice]="釣果報告が完了しました！"
		# else
		# 	@f_report = FishingReport.all
		# 	render :new_fishing_report
		# end

	end

	def show
		@f_report = FishingReport.find(params[:id])
		# @f_report = FishingReport.find_by(id: params[:id])
		@f_reports = FishingReport.all
		@spots = FishingSpot.all
		@lure_types = LureType.all
		@comment = ReportComment.new 
		@complaint = Complaint.new
	end

	def edit
		@f_report = FishingReport.find(params[:id])
		# @f_report = FishingReport.find_by(id: params[:id])
	end

	

	def update
		@f_report = FishingReport.find(params[:id])
		@f_report.update(fishing_report_params)
		redirect_to fishing_reports_path
	end

	def destroy
		@f_report = FishingReport.find(params[:id])
		@f_report.destroy
		redirect_to fishing_reports_path
	end

	private
	def fishing_report_params
		params.require(:fishing_report).permit(:fishing_spot_id, :fishing_date, :time, :weather, :size, :lure_type_id, :range, :retrieve, :lure_name, :fishing_body, :a_image, :b_image, :c_image, :d_image, :e_image )
	end
end
