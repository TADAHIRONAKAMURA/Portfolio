class TackleReport < ApplicationRecord

	belongs_to	:user
	belongs_to	:lure_type
	belongs_to	:maker

	attachment :tackle_image

	enum evaluation: { ☆: 1, ☆☆: 2, ☆☆☆: 3, ☆☆☆☆: 4, ☆☆☆☆☆: 5 } 
	
end
