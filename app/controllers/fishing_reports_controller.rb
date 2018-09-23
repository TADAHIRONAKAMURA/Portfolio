class FishingReportsController < ApplicationController
	before_action :user_admin

	def index
		if admin_signed_in?
			@f_reports = FishingReport.all
			@tackles = TackleReport.all
			@spots = FishingSpot.all
			@lure_types = LureType.all
		else
			redirect_to root_path
		end
	end

	def new
		@f_report = FishingReport.new
		@luretype = LureType.all
	end

	def create
		@f_report = FishingReport.new(fishing_report_params)
		@f_report.user_id = current_user.id
		if @f_report.save
			redirect_to mypage_path
			flash[:notice]="釣果報告が完了しました！"
		else
			render :new
		end
	end

	def show
			@f_report = FishingReport.find(params[:id])
			@f_reports = FishingReport.all
			@spots = FishingSpot.all
			@lure_types = LureType.all
			@comment = ReportComment.new 
			@complaint = Complaint.new
	end

	def edit
		if admin_signed_in?
			@f_report = FishingReport.find(params[:id])
		elsif user_signed_in?
			@f_report = FishingReport.find(params[:id])
			@user == current_user
		else
			redirect_to root_path
		end
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

	def user_admin
		if user_signed_in? || admin_signed_in?
		else
			redirect_to root_path
			flash[:notice]="ログインもしくはサインアップしてから閲覧してください。！"
		end	
	end
end
