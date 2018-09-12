class CreateReportComments < ActiveRecord::Migration[5.2]
  	def change
    	create_table :report_comments do |t|
    		t.integer :user_id, :null => false
    		t.integer :fishing_report_id, :null => false
    		t.text :comment, :null => false
      	t.timestamps
    	end
  	end
end
