class CreateFishingSpots < ActiveRecord::Migration[5.2]
  	def change
    	create_table :fishing_spots do |t|
    		t.integer :spot_number, :null => false
			t.string :fishing_spot_name, :null => false
			t.string :fishing_spot_image_id
			t.string :fishing_top_image_id
			t.string :fishing_main_image_id
			t.text :fishing_spot_body
			t.timestamps
   	end
  	end
end