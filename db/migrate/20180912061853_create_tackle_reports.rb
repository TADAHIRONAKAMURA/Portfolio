class CreateTackleReports < ActiveRecord::Migration[5.2]
  	def change
    	create_table :tackle_reports do |t|
    		t.integer :user_id
			t.string :tackle_image_id, :null => false
			t.integer :evaluation, :null => false
			t.integer :maker_id, :null => false
			t.integer :lure_type_id, :null => false
			t.string :tackle_name, :null => false
			t.text :tackle_body, :null => false
      	t.timestamps
    	end
  	end
end
