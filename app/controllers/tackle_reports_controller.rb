class TackleReportsController < ApplicationController
	def index
		@tackles = TackleReport.all
		# @spots = FishingSpot.all
		# @lure_types = LureType.all
	end

	def new
		@tackle = TackleReport.new
	end

	def create
		@tackle = TackleReport.new(tackle_report_params)
		@tackle.user_id = current_user.id
		@tackle.save
		# puts @f_report.errors.full_messages
		redirect_to tackle_reports_path(@tackle.id)
		flash[:notice]="Tackle紹介が完了しました！"
	end

	def edit
		@tackle = TackleReport.find(params[:id])
		# @f_report = FishingReport.find_by(id: params[:id])
	end

	def update
		@tackle = TackleReport.find(params[:id])
		@tackle.update(fishing_report_params)
		redirect_to tackle_reports_path
	end

	def destroy
		@tackle = FishingReport.find(params[:id])
		@tackle.destroy
		redirect_to ftackle_reports_path
	end

	private
	def tackle_report_params
		params.require(:tackle_report).permit(:user_id, :tackle_image, :evaluation, :maker_id, :lure_type_id, :tackle_name, :tackle_body )
	end
end
