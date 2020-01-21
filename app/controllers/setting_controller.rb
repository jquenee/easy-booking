class SettingController < ApplicationController
  before_action :authenticate

  # PATCH /setting/1
  def update
    @setting = Settings.find(params[:id])
    @setting.update(setting_params)
    respond_to do |format|
      format.html { redirect_to '/admin/', notice: 'Setting was successfully updated.' }
      format.json { head :no_content }
    end
  end

private
  def setting_params
    params.require(:settings).permit(:value)
  end
end
