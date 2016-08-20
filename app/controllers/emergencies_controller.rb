class EmergenciesController < ApplicationController
  def index
    render json: { emergencies: Emergency.all }
  end

  def create
    emergency = Emergency.create(create_params)
    status = 201
    res_obj =
    if emergency.errors.blank?
      { message: nil, emergency: emergency }
    else
      status = 422
      { message: emergency.errors.messages }
    end
    render json: res_obj, status: status
  end

  private

  def create_params
    params.require(:emergency).permit(:code, :medical_severity, :fire_severity, :police_severity)
  end
end
