class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
        t.references :artist
        t.references :provider, polymorphic: true

        t.integer    :provider_id
    	t.string 	 :provider_type
        t.string     :performance_date
    	t.datetime	 :performance_time
    	t.string	 :school_name
    	t.string	 :school_email
    	t.string 	 :status

    	t.string	 :show_time
    	t.string	 :load_time
    	t.string	 :time_zone
    	t.string	 :load_address
    	t.string	 :contact_name
    	t.string	 :contact_phone
        t.string     :hotel_name
    	t.string	 :hotel_address
    	t.string	 :backup_content
    	t.string	 :backup_phone
    	t.boolean	 :contract_signed
    	t.boolean	 :payment_sent
    	t.boolean	 :show_review_complete

      t.timestamps
    end
  end
end