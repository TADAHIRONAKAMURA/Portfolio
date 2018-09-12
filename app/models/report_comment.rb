class ReportComment < ApplicationRecord

	belongs_to	:user
	belongs_to	:fishing_report
	
end
