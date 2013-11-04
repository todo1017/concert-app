class EventMailer < ActionMailer::Base
  default from: "admin@concert.com"

  def event_created(event)
  	@artist = event.artist
    mail(:to => event.school_email, :from => @artist.user.email, :subject => "New Event is created.")
  end
end
