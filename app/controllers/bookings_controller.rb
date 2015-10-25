class BookingsController < ApplicationController
  before_filter :authenticate

  def new
   @contacts = Contact.all   
   @booking = Booking.new
  end

  def create
   @booking = Booking.new(booking_params)

    respond_to do |format|
      if @booking.save
        format.html { redirect_to @booking, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @booking }
      else
        @contacts = Contact.all
        format.html { render :new }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  def show
    redirect_to '/calendar'
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def booking_params
      params.require(:booking).permit(:name, :phone, :start, :end, :full_price, :reduced_price)
    end
end
