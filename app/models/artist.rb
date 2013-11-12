class Artist < ActiveRecord::Base
  attr_accessible :name, :email, :price,
  	:tech_rider, :contract_rider, :poster, :picture, :w9, :resume

  has_many :events
  belongs_to :user

  scope :by_name, ->(name){ where("name like '%#{name}%'") }

  has_attached_file :poster, :styles => { :medium => "300x300>", mini: "120x120>", tiny: "50x50" }, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    default_url: "/assets/missing.jpg", 
    path: "upload/:class/:attachment/:style/:filename"

  has_attached_file :picture, :styles => { :medium => "300x300>", mini: "120x120>", tiny: "50x50" }, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    default_url: "/assets/missing.jpg", 
    path: "upload/:class/:attachment/:style/:filename"

  has_attached_file :tech_rider, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

	has_attached_file :contract_rider, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

  has_attached_file :w9, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

end
