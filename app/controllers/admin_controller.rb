class AdminController < ApplicationController
  before_action :authenticate

  # GET /admin
  def show
    @sessions = User.all
    @settings = Settings.all
    @prices = Price.all
    @contacts = Contact.all
    @new_contact = Contact.new
    @new_price = Price.new
  end

  # POST /upload
  def upload
    # upload file whatever the name
    uploader = FileUploader.new
    uploader.store!(params.dig(:manual, :file))
    logger.info("pdf upload successfully: #{params.dig(:manual, :file).original_filename}")

    # move/replace file with default path/name
    source = Rails.root.join("public/uploads", params.dig(:manual, :file).original_filename).to_s
    target = Rails.root.join("public", "mode-emploi.pdf").to_s
    FileUtils.mv(source, target)
    redirect_to '/admin'
  end
end
