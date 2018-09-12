class CreateLureTypes < ActiveRecord::Migration[5.2]
  	def change
    	create_table :lure_types do |t|
    		t.string :type_name, :null => false
      	t.timestamps
    	end
  	end
end
