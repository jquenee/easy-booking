module EmailsenderHelper

 def email_all_booking_message(booking)
  emails = contacts_email
  contact = Contact.find(booking.contact_id)
  message = "From: WebCalendar <noreply@" << Settings.find_by_key('smtp_domain').value << ">\n"
  message << "To: " << emails.to_s << "\n"
  message << "Content-Type: text/plain; charset=\"utf-8\"\n"
  message << "Content-Transfer-Encoding: 8bit\n"
  message << "Subject: [" << Settings.find_by_key('website_name').value << "] Nouvelle réservation\n\n"
  message << "Ceci est un email automatique.\n"
  message << "Une nouvelle réservation a été effectuée du " << booking.start.to_s << " au " << booking.end.to_s << " pour " << booking.name << ".\n"
  message << "Cette réservation a été effectuée par " << contact.name << " joignable au " << contact.phone << ".\n"
  message << (booking.full_price + booking.reduced_price).to_s << " personne(s) prévue(s) en plus.\n\n"
  message << "Pour visualiser le calendrier merci de vous connecter à http://" << Settings.find_by_key('website_url').value << "\n"
  message << "Mot de passe: " << Settings.find_by_key('website_password').value

  # asynchronous call for better front-end UX experience
  Thread.new {
   smtp = Net::SMTP.new(Settings.find_by_key('smtp_ip').value, Settings.find_by_key('smtp_port').value.to_i)
   # debug option
   if Settings.find_by_key('smtp_debug').value.to_boolean
     smtp.set_debug_output $stderr
     logger.info("emails to:")
     logger.info(emails.to_s)
     logger.info("message to send:")
     logger.info(message)
   end
   if Settings.find_by_key('smtp_ttls').value.to_boolean
  	smtp.enable_starttls
   else
	smtp.disable_starttls
   end
   smtp.start(Settings.find_by_key('smtp_domain').value, Settings.find_by_key('smtp_login').value, Settings.find_by_key('smtp_password').value, Rails.configuration.x.email_authtype) do
   	 smtp.send_message(message, "noreply@" << Settings.find_by_key('smtp_domain').value, emails)
   end
  }
end

 private

 def contacts_email
  emails = []
  contacts = Contact.all
  contacts.each do |contact|
    emails.push(contact.email)
  end
  return emails
 end

end
