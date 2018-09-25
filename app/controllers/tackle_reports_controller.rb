class TackleReportsController < ApplicationController
	def index
		@tackles = TackleReport.page(params[:page]).reverse_order
	end

	def new
		@tackle = TackleReport.new
	end

	def create
		@tackle = TackleReport.new(tackle_report_params)
		@tackle.user_id = current_user.id
		if @tackle.save
			if admin_signed_in?
				redirect_to tackle_reports_path
			elsif user_signed_in?
				redirect_to mypage_path
				flash[:notice]="Tackle紹介の投稿が完了しました！"
			end
		else
			render :new
		end
	end

	def edit
		@tackle = TackleReport.find(params[:id])
	end

	def update
		@tackle = TackleReport.find(params[:id])
		@tackle.update(tackle_report_params)
		if admin_signed_in?
			redirect_to tackle_reports_path
		elsif user_signed_in?
			redirect_to mypage_path
			flash[:notice]="Tackle紹介の編集が完了しました！"
		end
	end

	def destroy
		@tackle = FishingReport.find(params[:id])
		@tackle.destroy
		if admin_signed_in?
			redirect_to tackle_reports_path
		elsif user_signed_in?
			redirect_to mypage_path
			flash[:notice]="Tackle紹介の削除が完了しました！"
		end
	end

	private
	def tackle_report_params
		params.require(:tackle_report).permit(:user_id, :tackle_image, :evaluation, :maker_id, :lure_type_id, :tackle_name, :tackle_body )
	end
end
