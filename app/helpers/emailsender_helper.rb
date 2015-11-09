module EmailsenderHelper

 def email_all_booking_message(booking)
  message = "From: WebSite <noreply@fromdomain.com>\n"
  message << "To: All Contacts <contact@todomain.com>\n"
  message << "Subject: [SAINT MALO] Nouvelle réservation\n"
  message << "Name: " << booking.name

  # Net::SMTP.start('localhost') do |smtp|
  #	smtp.send_message message, 'me@fromdomain.com', 
  #      	                   'test@todomain.com'
  # end
  puts message
 end

end
