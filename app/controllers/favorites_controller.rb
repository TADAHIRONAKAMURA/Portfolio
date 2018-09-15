class FavoritesController < ApplicationController
	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
        favorite = current_user.favorites.new(fishing_report_id: @f_report.id)
        favorite.save
        redirect_to fishing_report_path(@f_report)
    end
    def destroy
    	@f_report = FishingReport.find(params[:fishing_report_id])
    	favorite = current_user.favorites.find_by(fishing_report_id: @f_report.id)
        # favorite
    	favorite.destroy
    	redirect_to fishing_report_path(@f_report)
    end
end
