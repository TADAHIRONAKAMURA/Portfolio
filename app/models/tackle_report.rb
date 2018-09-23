class TackleReport < ApplicationRecord

	belongs_to	:user
	belongs_to	:lure_type
	belongs_to	:maker

	validates :tackle_image, presence: true
	validates :evaluation, presence: true
	validates :tackle_name, length: { in: 1..25 }
	validates :tackle_body, length: { in: 1..300 }

	attachment :tackle_image

	enum evaluation: { ☆: 1, ☆☆: 2, ☆☆☆: 3, ☆☆☆☆: 4, ☆☆☆☆☆: 5 } 

	
end
