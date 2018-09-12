class CreateFishingReports < ActiveRecord::Migration[5.2]
  	def change
    	create_table :fishing_reports do |t|
    		t.integer :user_id, :null => false
			t.integer :fishing_spot_id, :null => false
			t.date :fishing_date, :null => false
			t.index :fishing_date
			t.integer :time, :null => false
			t.integer :weather, :null => false
			t.integer :size, :null => false
			t.integer :lure_type_id, :null => false
			t.integer :range, :null => false
			t.integer :retrieve, :null => false
			t.string :lure_name
			t.text :fishing_body, :null => false
			t.string :a_image_id, :null => false
			t.string :b_image_id
			t.string :c_image_id
			t.string :d_image_id
			t.string :e_image_id
			t.datetime :deleted_at
     		t.timestamps
    	end
  	end
end

