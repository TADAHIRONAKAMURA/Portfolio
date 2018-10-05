class FishingSpot < ApplicationRecord
	has_many	:fishing_reports, dependent: :destroy

	attachment :fishing_spot_image
	attachment :fishing_top_image
	attachment :fishing_main_image

	validates :fishing_spot_name, presence: true
	validates :fishing_spot_body, length: { maximum:500 }


end
