class RespondersController < ApplicationController
  before_action :responder_obj, except: [:index, :create]

  def index
    render json: { responders: Responder.all }
  end

  def create
    responder = Responder.create(create_params)
    status = :created
    res_obj =
    if responder.errors.blank?
      { responder: responder }
    else
      status = :unprocessable_entity
      { message: responder.errors.messages }
    end
    render json: res_obj, status: status
  end

  def show
    render json: { responder: @responder }
  end

  def update
    show && return if @responder.update_attributes(update_params)
    render json: { message: @responder.errors.messages }
  end

  private

  def create_params
    params.require(:responder).permit(:type, :name, :capacity)
  end

  def update_params
    params.require(:responder).permit(:on_duty)
  end

  def responder_obj
    @responder = Responder.find_by(name: params[:name])
  end
end
