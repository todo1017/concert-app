class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
    	t.references :user
    	t.string			:name
    	t.decimal			:price
    	t.attachment	:tech_rider
    	t.attachment	:contract_rider
    	t.attachment 	:poster
    	t.attachment 	:picture
    	t.attachment 	:w9
    	t.string			:resume, limit: 5000

      t.timestamps
    end
  end
end
