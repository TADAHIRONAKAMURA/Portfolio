class CreateComplaints < ActiveRecord::Migration[5.2]
  	def change
    	create_table :complaints do |t|
    		t.integer :user_id, :null => false
    		t.integer :fishing_report_id, :null => false
    		t.text :c_comment, :null => false
      	t.timestamps
   	end
  	end
end
