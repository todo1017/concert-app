class EventMailer < ActionMailer::Base
  default from: "admin@concert.com"

  def event_created(artist)
  	@artist = artist
    mail(:to => artist.school_email, :from => artist.user.email, :subject => "Subscription Cancelled")
  end
end
