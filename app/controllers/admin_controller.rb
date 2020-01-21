class AdminController < ApplicationController
  before_action :authenticate

  # GET /admin
  def show
    @settings = Settings.all
    @prices = Price.all
    @contacts = Contact.all
    @new_contact = Contact.new
    @new_price = Price.new
  end

end
