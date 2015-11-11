module EmailsenderHelper

 def email_all_booking_message(booking)
  emails = contacts_email
  contact = Contact.find(booking.contact_id)
  message = "From: WebCalendar <noreply@" << Rails.configuration.x.email_smtp_domain << ">\n"
  message << "To: " << emails << "\n"
  message << "Subject: [" << Rails.configuration.x.name << "] Nouvelle réservation\n\n"
  message << "Ceci est un email automatique.\n"
  message << "Une nouvelle réservation a été effectuée du " << booking.start.to_s << " au " << booking.end.to_s << " pour " << booking.name << ".\n"
  message << "Cette réservation a été effectuée par " << contact.name << " joignale au " << contact.phone << ".\n"
  message << (booking.full_price + booking.reduced_price).to_s << " personne(s) prévue(s) en plus.\n\n"
  message << "Pour visualiser le caldendrier merci de vous connecter à http://" << Rails.configuration.x.website_url << "\n"
  message << "Mot de passe: " << Rails.configuration.x.password 

  smtp = Net::SMTP.new(Rails.configuration.x.email_smtp_ip, Rails.configuration.x.email_smtp_port)
  smtp.enable_starttls
  smtp.start(Rails.configuration.x.email_smtp_domain, Rails.configuration.x.email_smtp_login, Rails.configuration.x.email_smtp_password, :login) do
  	smtp.send_message(message, "noreply@" << Rails.configuration.x.email_smtp_domain, emails)
  end
  puts "email sent"
  puts message
 end

 private

 def contacts_email
  emails = ""
  contacts = Contact.all
  contacts.each do |contact|
    emails << contact.email << ","
  end
  return emails[0..(emails.length-1)]  
 end

end
