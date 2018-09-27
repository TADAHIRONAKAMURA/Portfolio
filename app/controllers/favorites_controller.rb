class FavoritesController < ApplicationController
	def create
		@f_report = FishingReport.find(params[:fishing_report_id])
        favorite = current_user.favorites.new(fishing_report_id: @f_report.id)
        favorite.save

        favorite.reload
        respond_to do |format|
            format.html { render @f_report }
            format.js
        end
    end

    def destroy
    	@f_report = FishingReport.find(params[:fishing_report_id])
    	favorite = current_user.favorites.find_by(fishing_report_id: @f_report.id)
    	favorite.destroy

        @f_report.reload
        respond_to do |format|
            format.html { render @f_report }
            format.js
        end
    end
end
