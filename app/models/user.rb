class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :stripe_token, :coupon

  has_many  :events, as: :provider # provider is school contact user
  has_many  :artists
  scope :supervisor , joins(:roles).where("roles.name = 'supervisor'")

  def name
    begin
      return self.first_name + " " + self.last_name
    rescue
      
    end
  end

  def update_plan(role)
    self.role_ids = []
    self.add_role(role.name)
  end
  
  def expire
    UserMailer.expire_email(self).deliver
    destroy
  end
  
end