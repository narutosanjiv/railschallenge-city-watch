class EmergenciesController < ApplicationController
  def index
    render json: { emergencies: Emergency.all }
  end
end
