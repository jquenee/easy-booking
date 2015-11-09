module BookingsHelper

  def night(booking)
    (booking.end - booking.start).to_i + 1
  end
  
  def total(booking)
     nights = night(booking) 
     (nights * booking.full_price * Rails.configuration.x.full_price) + (nights * booking.reduced_price * Rails.configuration.x.reduced_price)
  end
end
