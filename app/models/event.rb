class Event < ActiveRecord::Base
  attr_accessible :school_name, :school_email, :status, :artist_id,
  		:show_time, :load_time, :time_zone, :load_address,
			:contact_name, :contact_phone, :hotel_name, :hotel_address, :backup_content,
			:backup_phone, :contract_signed, :payment_sent, :show_review_complete

	belongs_to :artist
	belongs_to :provider, polymorphic: true # school contact user

	STATUS = %w[Confirmed Tentative Interested]
end
