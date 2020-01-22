class PriceController < ApplicationController
  before_action :authenticate_admin
  before_action :set_price, only: [:update, :destroy]

  # POST /price/create
  def create
   @price = Price.new(price_params)
   @price.save
   respond_to do |format|
     format.html { redirect_to '/admin/', notice: 'Contact was successfully created.' }
     format.json { head :no_content }
   end
  end

  # PATCH /price/1
  def update
    @price.update(price_params)
    respond_to do |format|
      format.html { redirect_to '/admin/', notice: 'Price was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /price/1
  # DELETE /price/1.json
  def destroy
    @price.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/', notice: 'Price was successfully deleted.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_price
    @price = Price.find(params[:id])
  end

  def price_params
    params.require(:price).permit(:key, :value)
  end
end
