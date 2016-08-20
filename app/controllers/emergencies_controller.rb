class EmergenciesController < ApplicationController
  before_action :emergency_obj
  def index
    render json: { emergencies: Emergency.all }
  end

  def create
    emergency = Emergency.create(create_params)
    status = :created
    res_obj =
    if emergency.errors.blank?
      { message: nil, emergency: emergency }
    else
      status = :unprocessable_entity
      { message: emergency.errors.messages }
    end
    render json: res_obj, status: status
  end

  def show
    render json: { emergency: @emergency }
  end

  def update
    show && return if @emergency.update_attributes(update_params)
    render json: { message: @emergency.errors.messages }
  end

  private

  def create_params
    params.require(:emergency).permit(:code, :medical_severity, :fire_severity, :police_severity)
  end

  def update_params
    params.require(:emergency).permit(:medical_severity, :fire_severity, :police_severity, :resolved_at)
  end

  def emergency_obj
    @emergency = Emergency.find_by(code: params[:code])
  end
end
