class ReportComment < ApplicationRecord

	belongs_to	:user
	belongs_to	:fishing_report

	validates :comment, length: { in: 1..100 }
	
end
