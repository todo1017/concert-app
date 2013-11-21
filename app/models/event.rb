class Event < ActiveRecord::Base
  attr_accessible :school_name, :school_email, :status, :performance_date, :artist_id, :contract,
  		:show_time, :load_time, :time_zone, :load_address,
			:contact_name, :contact_phone, :hotel_name, :hotel_address, :backup_content,
			:backup_phone, :contract_signed, :payment_sent, :show_review_complete

	belongs_to :artist
	belongs_to :provider, polymorphic: true # school contact user

	has_attached_file :contract, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

	scope :by_artist, ->(artist){ where(artist_id: artist)}
	scope :past, 			->{where("performance_time < ?", Time.now)}
	scope :upcoming, 	->{where("performance_time > ?", Time.now)}

	STATUS = %w[Confirmed Tentative Interested]
end
