class TackleReport < ApplicationRecord

	belongs_to	:user
	belongs_to	:lure_type
	belongs_to	:maker
	
end
