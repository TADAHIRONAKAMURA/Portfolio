class FishingSpot < ApplicationRecord
	has_many	:fishing_reports, dependent: :destroy

	validates :fishing_spot_name, presence: true

	attachment :fishing_spot_image
	attachment :fishing_top_image
	attachment :fishing_main_image
	
end
