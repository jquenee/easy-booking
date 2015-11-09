class CalendarController < ApplicationController
 attr_accessor :start_date
 before_filter :authenticate
 helper_method :start_date, :date_range, :td_occupied
 
  # provide table of date for the calendar 
  def date_range
    (start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week).to_a
  end

 # build HTML block for one day booking
 def td_occupied(day, bookings)
   div_day = "<div class=\"day\">" << day.mday.to_s << "</div>"
   divs = ""
   total = 0
   bookings.each do |booking|
    # occupied
    if booking.start <= day and booking.end >= day
      divs +=  "<div class=\"booking b" << booking.id.modulo(7).to_s << "\">" << "<a class=\"booking\"  href=\"#popup\" id=" << booking.id.to_s << ">" << booking.name << "</a>"<< "</div>"
      total += booking.full_price + booking.reduced_price
    end
   end
   # free
   if divs == ""
    divs = "<div class=\"free\"><a href=\"/bookings/new?start=" + day.strftime("%d%m%Y") + "\">Libre</a></div>"
    return "<td>" << div_day << divs << "</td>"
   end
   div_total = "<div class=\"total\">" << total.to_s << " personnes</div>"
   return "<td class=\"occupied\">" << div_day << divs << div_total << "</td>"
 end
 
 # GET /calendar/012015
 def show
  @prices = Price.all
  @date = params[:id]
  if @date == nil
   @date = Date.today.strftime("%m%Y")
  end
  self.start_date = Date.strptime(@date, '%m%Y')
  @bookings = Booking.where("start <= :end_date AND end >= :start_date",
  {start_date: self.start_date.beginning_of_month, 
   end_date: self.start_date.end_of_month})
  puts "Show date " + @date 
 end
 
end
