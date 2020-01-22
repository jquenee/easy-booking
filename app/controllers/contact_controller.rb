class ContactController < ApplicationController
  before_action :authenticate_admin
  before_action :set_contact, only: [:update, :destroy]

  # POST /contact/create
  def create
   @contact = Contact.new(contact_params)
   @contact.save
   respond_to do |format|
     format.html { redirect_to '/admin/', notice: 'Contact was successfully created.' }
     format.json { head :no_content }
   end
  end

  # PATCH /contact/1
  def update
    @contact.update(contact_params)
    respond_to do |format|
      format.html { redirect_to '/admin/', notice: 'Contact was successfully updated.' }
      format.json { head :no_content }
    end
  end

  # DELETE /contact/1
  # DELETE /contact/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/', notice: 'Contact was successfully deleted.' }
      format.json { head :no_content }
    end
  end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_contact
    @contact = Contact.find(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :phone, :email)
  end
end
