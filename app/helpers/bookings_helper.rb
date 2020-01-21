module BookingsHelper

  def night(booking)
    (booking.end - booking.start).to_i + 1
  end

  def total(booking)
     nights = night(booking)
     (nights * booking.full_price * Settings.find_by_key('full_price').value.to_i) + (nights * booking.reduced_price * Settings.find_by_key('reduced_price').value.to_i)
  end
end
