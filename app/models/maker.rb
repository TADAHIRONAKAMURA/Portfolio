class Maker < ApplicationRecord

	has_many	:tackle_report,	dependent: :nullify
	
end
