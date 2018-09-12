class LureType < ApplicationRecord

	has_many	:fishing_reports,	dependent: :nullify	
	has_many	:tackle_reports,	dependent: :nullify
		
end
